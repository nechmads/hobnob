class RenameEventsTypeColumnToEventType < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.rename :type, :event_type
    end
  end

  def self.down
    change_table :events do |t|
      t.rename :event_type, :type
    end
  end
end
