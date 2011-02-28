class AddTimeToCheckins < ActiveRecord::Migration
  def self.up
    add_column :checkins, :time, :datetime
  end

  def self.down
    remove_column :checkins, :time
  end
end
