class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.string :iso2
      t.string :iso3

      t.timestamps
    end
    add_index :languages, :name, unique: true
  end
end
