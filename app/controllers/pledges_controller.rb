class PledgesController < ApplicationController
  before_filter :load_leaderboards, only: [:create]

  def new
    @pledge = @campaign.pledges.build(params[:pledge])
    @pledge.dot_color ||= Pledge.random_hex
    @pledge.amount = 0.07
    @pledge.cap ||= @pledge.amount.mult(@campaign.donor_target, 2)
    @pledge.build_donor
    @team_id = params[:team_id]
  end

  def create
    @pledge = @campaign.pledges.build(params[:pledge])
    @pledge.dot_color ||= Pledge.random_hex
    @pledge.pledge_type = 'dollar'
    @team = @pledge.team
    begin
      api_key = AccessToken.stripe_api_key(@campaign.subdomain, @stripe_mode_param)
      c = Stripe::Customer.create({description: @pledge.donor.email, card: params[:stripe_card_token]}, api_key)
      @pledge.donor.stripe_customer ||= c
    rescue Exception => e
      logger.debug e.inspect
      flash[:error] = "Error validating credit card information."
      render action: 'new' and return
    end

    if @pledge.save
      begin
        PledgeMailer.pledge_receipt_email(@pledge).deliver
      rescue Net::SMTPAuthenticationError => nsae
        logger.debug nsae.inspect
      end
      render 'create'
    else
      Rails.logger.debug @pledge.errors.full_messages
      render action: 'new'
    end
  end

end
