class AddSentTimeToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :sent_time, :datetime
  end

  def self.down
    remove_column :messages, :sent_time
  end
end
