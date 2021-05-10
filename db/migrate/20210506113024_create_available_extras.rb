class CreateAvailableExtras < ActiveRecord::Migration[6.1]
  def change
    create_table :available_extras do |t|
      t.belongs_to :service_extra
      t.belongs_to :user
      t.decimal :price, null: false
      t.timestamps
    end
  end
end
