class AddCompanyInfoToIdentity < ActiveRecord::Migration
  def self.up
    add_column :identities, :industry, :string
  end

  def self.down
    remove_column :identities, :industry
  end
end
