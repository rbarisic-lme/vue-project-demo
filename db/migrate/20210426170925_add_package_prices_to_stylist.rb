class AddPackagePricesToStylist < ActiveRecord::Migration[6.1]
  def change
    add_column :stylists, :service_package_basic_hair_price, :decimal
    add_column :stylists, :service_package_basic_makeup_price, :decimal
    add_column :stylists, :service_package_standard_price, :decimal
    add_column :stylists, :service_package_premium_price, :decimal
  end
end
