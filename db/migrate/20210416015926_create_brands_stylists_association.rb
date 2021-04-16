class CreateBrandsStylistsAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :brands_stylists do |t|
      t.belongs_to :brand
      t.belongs_to :stylist
    end
  end
end
