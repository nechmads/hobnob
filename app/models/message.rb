class Message < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :title, :body, :is_read, :sent_time
  
end


# == Schema Information
#
# Table name: messages
#
#  id           :integer(4)      not null, primary key
#  sender_id    :integer(4)
#  recipient_id :integer(4)
#  title        :string(255)
#  body         :text
#  is_read      :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#  sent_time    :datetime
#

