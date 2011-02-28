require 'spec_helper'

describe User do
  it "should create a new user with just a linkedin user id" do
    @user = User.new({:linkedin_id => 'newLinkedInId', :email => 'newLinkedInId@email.com', :password => "password"})
    @user.should be_valid
  end
end


# == Schema Information
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  email                     :string(255)     default(""), not null
#  encrypted_password        :string(128)     default(""), not null
#  password_salt             :string(255)     default(""), not null
#  reset_password_token      :string(255)
#  remember_token            :string(255)
#  remember_created_at       :datetime
#  sign_in_count             :integer(4)      default(0)
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string(255)
#  last_sign_in_ip           :string(255)
#  authentication_token      :string(255)
#  failed_attempts           :integer(4)      default(0)
#  unlock_token              :string(255)
#  locked_at                 :datetime
#  created_at                :datetime
#  updated_at                :datetime
#  first_name                :string(255)
#  last_name                 :string(255)
#  linkedin_id               :string(255)
#  lat                       :string(255)
#  lng                       :string(255)
#  default_identity_id       :integer(4)
#  last_location_update_time :datetime
#

