class Event < ActiveRecord::Base
  attr_accessible :name, :description, :event_type, :collection, :track, :time, :place_id
  belongs_to :place
end


# == Schema Information
#
# Table name: events
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  event_type  :integer(4)
#  collection  :integer(4)
#  track       :integer(4)
#  time        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  place_id    :integer(4)
#

