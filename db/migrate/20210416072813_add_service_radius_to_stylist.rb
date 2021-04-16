class AddServiceRadiusToStylist < ActiveRecord::Migration[6.1]
  def change
    add_column :stylists, :service_radius, :int
  end
end
