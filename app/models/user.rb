class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :password_salt, :encrypted_password
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :linkedin_id
  
  has_many :identities, :dependent => :destroy
end
