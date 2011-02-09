class AddDefaultIdentityIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :default_identity_id, :integer
  end

  def self.down
    remove_column :users, :default_identity_id
  end
end
