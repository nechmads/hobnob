class Identity < ActiveRecord::Base
  attr_accessible :identity_name, :first_name, :last_name, :company_name, :title, :country, :state, :city, :address, :email, :cell, :phone,
                  :skype, :messenger, :gtalk, :facebook, :twitter, :linkedin, :flickr, :blog, :youtube, :birthday, :photo_url, :description,
                  :qr_url, :user_id, :industry
  
  belongs_to :user
  has_attached_file :photo,
        :storage => :s3,
        :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
        :path => "/:style/:filename"
        
  email_regex = /\A[ \w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :identity_name, :presence => true, :length => { :maximum => 50 }
  validates :user_id, :presence => true
  validates :first_name, :length => { :maximum => 50 }
  validates :last_name, :length => { :maximum => 50 }
  validates :company_name, :length => { :maximum => 50 }
  validates :title, :length => { :maximum => 50 }
  validates :industry, :length => { :maximum => 50 }
  validates :country, :length => { :maximum => 50 }
  validates :state, :length => { :maximum => 2 }
  validates :city, :length => { :maximum => 50 }
  validates :address, :length => { :maximum => 50 }
  validates :email, :length => { :maximum => 50, :format => { :with => email_regex }}
  validates :cell, :length => { :maximum => 50 }
  validates :phone, :length => { :maximum => 50 }
  validates :skype, :length => { :maximum => 50 }
  validates :messenger, :length => { :maximum => 50 }
  validates :gtalk, :length => { :maximum => 50 }
  validates :facebook, :length => { :maximum => 50 }
  validates :twitter, :length => { :maximum => 50 }
  validates :linkedin, :length => { :maximum => 50 }
  validates :flickr, :length => { :maximum => 50 }
  validates :blog, :length => { :maximum => 255 }
  validates :youtube, :length => { :maximum => 50 }
  validates :birthday, :length => { :maximum => 10 }
  validates :photo_url, :length => { :maximum => 255 }
  validates :description, :length => { :maximum => 280 }
  
  default_scope :order => 'identities.created_at DESC'
end

# == Schema Information
#
# Table name: identities
#
#  id            :integer(4)      not null, primary key
#  user_id       :integer(4)
#  identity_name :string(255)
#  first_name    :string(255)
#  last_name     :string(255)
#  company_name  :string(255)
#  title         :string(255)
#  country       :string(255)
#  state         :string(255)
#  city          :string(255)
#  address       :string(255)
#  email         :string(255)
#  cell          :string(255)
#  phone         :string(255)
#  skype         :string(255)
#  messenger     :string(255)
#  gtalk         :string(255)
#  facebook      :string(255)
#  twitter       :string(255)
#  linkedin      :string(255)
#  flickr        :string(255)
#  blog          :string(255)
#  youtube       :string(255)
#  birthday      :string(255)
#  photo_url     :string(255)
#  description   :text
#  qr_url        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  industry      :string(255)
#

