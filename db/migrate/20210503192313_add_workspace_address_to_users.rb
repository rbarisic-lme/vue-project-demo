class AddWorkspaceAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :workspace_street, :string
    add_column :users, :workspace_city, :string
    add_column :users, :workspace_zipcode, :string
    add_column :users, :workspace_country, :string
  end
end
