class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.database_authenticatable :null => true
      t.rememberable
      t.trackable
      t.token_authenticatable
      
      t.timestamps
    end
    
    add_index :users, :email,                :unique => true
    add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
