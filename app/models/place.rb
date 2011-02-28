class Place < ActiveRecord::Base
  acts_as_mappable  :default_units => :miles
  
  attr_accessible :lat, :lng, :name, :isTimeBase, :start, :end, :foursquare_id
  
  has_many :checkins
  has_many :events
  
end



# == Schema Information
#
# Table name: places
#
#  id            :integer(4)      not null, primary key
#  lat           :string(255)
#  lng           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  isTimeBase    :boolean(1)
#  start         :datetime
#  end           :datetime
#  name          :string(255)
#  foursquare_id :string(255)
#

