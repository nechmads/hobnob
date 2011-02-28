class Checkin < ActiveRecord::Base
  attr_accessible :user_id, :place_id, :time, :message
  
  belongs_to :user
  belongs_to :place
end



# == Schema Information
#
# Table name: checkins
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  place_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  time       :datetime
#  message    :string(255)
#

