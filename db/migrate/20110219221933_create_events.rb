class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :type
      t.integer :collection
      t.integer :track
      t.datetime :time
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
