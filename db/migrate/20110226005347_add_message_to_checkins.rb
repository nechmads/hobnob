class AddMessageToCheckins < ActiveRecord::Migration
  def self.up
    add_column :checkins, :message, :string
  end

  def self.down
    remove_column :checkins, :message
  end
end
