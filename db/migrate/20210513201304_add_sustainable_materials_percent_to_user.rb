class AddSustainableMaterialsPercentToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sustainable_materials_percent, :decimal
  end
end
