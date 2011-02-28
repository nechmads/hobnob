class AddLastLocationUpdateTimeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_location_update_time, :datetime
  end

  def self.down
    remove_column :users, :last_location_update_time
  end
end
