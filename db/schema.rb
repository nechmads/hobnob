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

ActiveRecord::Schema.define(:version => 20110226005347) do

  create_table "checkins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time"
    t.string   "message"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "event_type"
    t.integer  "collection"
    t.integer  "track"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
  end

  create_table "identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "identity_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "title"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "email"
    t.string   "cell"
    t.string   "phone"
    t.string   "skype"
    t.string   "messenger"
    t.string   "gtalk"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "flickr"
    t.string   "blog"
    t.string   "youtube"
    t.string   "birthday"
    t.string   "photo_url"
    t.text     "description"
    t.string   "qr_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "industry"
  end

  add_index "identities", ["user_id"], :name => "index_identities_on_user_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "locationable_id"
    t.string   "locationable_type"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "is_read"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "sent_time"
  end

  create_table "places", :force => true do |t|
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isTimeBase"
    t.datetime "start"
    t.datetime "end"
    t.string   "name"
    t.string   "foursquare_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                    :default => "", :null => false
    t.string   "encrypted_password",        :limit => 128, :default => "", :null => false
    t.string   "password_salt",                            :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                            :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.integer  "failed_attempts",                          :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "linkedin_id"
    t.string   "lat"
    t.string   "lng"
    t.integer  "default_identity_id"
    t.datetime "last_location_update_time"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
