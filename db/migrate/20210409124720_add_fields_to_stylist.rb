class AddFieldsToStylist < ActiveRecord::Migration[6.1]
  def change
    add_column :stylists, :first_name, :string
    add_column :stylists, :last_name, :string

    add_column :stylists, :street, :string
    add_column :stylists, :city, :string
    add_column :stylists, :zipcode, :string
    add_column :stylists, :country, :string

    add_column :stylists, :phone, :string

    add_column :stylists, :address_latitude, :string
    add_column :stylists, :address_longitude, :string
  end
end
