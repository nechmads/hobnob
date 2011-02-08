class Identity < ActiveRecord::Base
  attr_accessible :identity_name, :first_name, :last_name, :company_name, :title, :country, :state, :city, :address, :email, :cell, :phone,
                  :skype, :messenger, :gtalk, :facebook, :twitter, :linkedin, :flickr, :blog, :youtube, :birthday, :photo_url, :description,
                  :qr_url, :user_id
  
  belongs_to :user
  
  email_regex = /\A[ \w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :identity_name, :presence => true, :length => { :maximum => 50 }
  validates :user_id, :presence => true
  validates :first_name, :length => { :maximum => 50 }
  validates :last_name, :length => { :maximum => 50 }
  validates :company_name, :length => { :maximum => 50 }
  validates :title, :length => { :maximum => 50 }
  validates :country, :length => { :maximum => 50 }
  validates :state, :length => { :maximum => 2 }
  validates :city, :length => { :maximum => 50 }
  validates :address, :length => { :maximum => 50 }
  validates :email, :presence => true, :length => { :maximum => 50, :format => { :with => email_regex }}
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
  validates :photo_url, :length => { :maximum => 50 }
  validates :description, :length => { :maximum => 280 }
  
  default_scope :order => 'identities.created_at DESC'
end
