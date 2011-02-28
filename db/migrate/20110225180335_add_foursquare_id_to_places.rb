class AddFoursquareIdToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :foursquare_id, :string
  end

  def self.down
    remove_column :places, :foursquare_id
  end
end
