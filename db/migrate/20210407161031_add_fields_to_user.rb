class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false

    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zipcode, :string
    add_column :users, :country, :string

    add_column :users, :phone, :string

    add_column :users, :address_latitude, :string
    add_column :users, :address_longitude, :string
  end
end
