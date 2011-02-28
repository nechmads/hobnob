require 'spec_helper'

describe Message do
  pending "add some examples to (or delete) #{__FILE__}"
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

