class AddStylistTutorialReadToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stylist_tutorial_read, :boolean, default: false
  end
end
