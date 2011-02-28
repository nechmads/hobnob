class AddTimeToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :isTimeBase, :boolean
    add_column :places, :start, :datetime
    add_column :places, :end, :datetime
  end

  def self.down
    remove_column :places, :end
    remove_column :places, :start
    remove_column :places, :isTimeBase
  end
end
