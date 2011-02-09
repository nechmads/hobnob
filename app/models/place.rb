class Place < ActiveRecord::Base
  acts_as_mappable  :default_units => :miles
  
  attr_accessible :lat, :lng
  
  has_many :checkins
end
