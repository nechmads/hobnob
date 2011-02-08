class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.integer :user_id
      t.string :lat
      t.string :lng
      
      t.timestamps
    end
    
    add_index :locations, :user_id
  end

  def self.down
    drop_table :locations
  end
end
