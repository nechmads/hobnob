class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :password_salt, :encrypted_password
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :linkedin_id, :last_location_id, :lat,
                  :lng, :default_identity_id
  
  has_many :identities, :dependent => :destroy
  has_many :checkins, :dependent => :destroy 
  
  acts_as_mappable  :default_units => :miles
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

