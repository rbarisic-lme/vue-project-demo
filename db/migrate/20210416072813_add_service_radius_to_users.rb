class AddServiceRadiusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :service_radius, :int
  end
end
