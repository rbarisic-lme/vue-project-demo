class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :city
      t.string :street
      t.string :zipcode
      t.string :country
      t.string :legal_form
      t.string :tax_id
      t.string :vat
      t.integer :tax_rate, default: 19

      t.references :user, index: true

      t.timestamps
    end
    # add_index :businesses, :user_id
  end
end
