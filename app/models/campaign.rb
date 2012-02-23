class Campaign < ActiveRecord::Base
  def percent_complete
    return 0 if donation_total.nil?
    [(donation_total/donation_target*100).round.to_i, 100].min
  end
end
