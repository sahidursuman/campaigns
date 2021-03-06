# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140206182644) do

  create_table "campaigns", :force => true do |t|
    t.decimal  "donation_target",  :precision => 20, :scale => 2
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.string   "name"
    t.string   "subdomain"
    t.date     "ends_on"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.date     "starts_on"
    t.integer  "match_amount",                                    :default => 1
    t.string   "campaign_type",                                   :default => "penny"
    t.string   "url"
    t.integer  "donor_target"
    t.string   "youtube_video_id"
  end

  create_table "dancers", :force => true do |t|
    t.string   "confirmation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "confirmed_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "sequence"
  end

  create_table "donors", :force => true do |t|
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "campaign_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "state",                      :limit => 2
    t.string   "zip",                        :limit => 9
    t.string   "phone",                      :limit => 10
    t.boolean  "terms_of_service"
    t.boolean  "email_opt_in"
    t.text     "stripe_customer"
    t.datetime "processed_at"
    t.datetime "confirmation_email_at"
    t.text     "stripe_response"
    t.datetime "confirmation_correction_at"
  end

  create_table "pledges", :force => true do |t|
    t.integer  "campaign_id"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.string   "pledge_type"
    t.integer  "donor_id"
    t.decimal  "amount",                           :precision => 10, :scale => 2
    t.decimal  "cap",                              :precision => 10, :scale => 2
    t.boolean  "donate_cap"
    t.string   "dot_color",           :limit => 7
    t.string   "dot_comment"
    t.boolean  "donate_bonus"
    t.integer  "team_id"
    t.integer  "stretch_goal_donors"
    t.decimal  "stretch_goal_amount",              :precision => 10, :scale => 2
    t.integer  "dancer_id"
  end

  create_table "teams", :force => true do |t|
    t.string   "captain_first_name"
    t.string   "captain_last_name"
    t.string   "captain_email"
    t.string   "name"
    t.string   "program"
    t.string   "sport"
    t.string   "charity"
    t.date     "sourced_on"
    t.string   "url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
