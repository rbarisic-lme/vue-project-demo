class AddServiceMobilityToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :service_mobility, :boolean
  end
end
