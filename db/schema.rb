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

ActiveRecord::Schema.define(:version => 20121128015845) do

  create_table "bigbluebutton_rooms", :force => true do |t|
    t.integer  "server_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "meetingid"
    t.string   "name"
    t.string   "attendee_password"
    t.string   "moderator_password"
    t.string   "welcome_msg"
    t.string   "logout_url"
    t.string   "voice_bridge"
    t.string   "dial_number"
    t.integer  "max_participants"
    t.boolean  "private",             :default => false
    t.boolean  "randomize_meetingid", :default => true
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "external",            :default => false
    t.string   "param"
  end

  add_index "bigbluebutton_rooms", ["meetingid"], :name => "index_bigbluebutton_rooms_on_meetingid", :unique => true
  add_index "bigbluebutton_rooms", ["server_id"], :name => "index_bigbluebutton_rooms_on_server_id"
  add_index "bigbluebutton_rooms", ["voice_bridge"], :name => "index_bigbluebutton_rooms_on_voice_bridge", :unique => true

  create_table "bigbluebutton_servers", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "salt"
    t.string   "version"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "param"
  end

  create_table "profiles", :force => true do |t|
    t.string   "organization"
    t.string   "address"
    t.string   "phone"
    t.string   "city"
    t.string   "country"
    t.text     "about"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "name",                                              :null => false
    t.text     "description"
    t.text     "signature"
    t.string   "domain"
    t.string   "locale"
    t.string   "feedback_url"
    t.string   "analytics_code"
    t.boolean  "exception_notifications",        :default => false
    t.string   "exception_notifications_email"
    t.string   "exception_notifications_prefix"
    t.boolean  "shib_enabled",                   :default => false
    t.string   "shib_name_field"
    t.string   "shib_email_field"
    t.string   "smtp_user_name"
    t.string   "smtp_password"
    t.boolean  "smtp_auto_tls"
    t.string   "smtp_server"
    t.integer  "smtp_port"
    t.string   "smtp_domain"
    t.string   "smtp_auth_type"
    t.string   "smtp_sender"
    t.boolean  "chat_enabled",                   :default => false
    t.string   "xmpp_domain"
    t.string   "xmpp_server"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "username",                                  :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "locale"
    t.boolean  "superuser",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
