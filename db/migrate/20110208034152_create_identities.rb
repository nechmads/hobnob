class CreateIdentities < ActiveRecord::Migration
  def self.up
    create_table :identities do |t|
      t.integer :user_id
      t.string :identity_name
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :title
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :email
      t.string :cell
      t.string :phone
      t.string :skype
      t.string :messenger
      t.string :gtalk
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :flickr
      t.string :blog
      t.string :youtube
      t.string :birthday
      t.string :photo_url
      t.text :description
      t.string :qr_url

      t.timestamps
    end
    
    add_index :identities, :user_id
  end

  def self.down
    drop_table :identities
  end
end
