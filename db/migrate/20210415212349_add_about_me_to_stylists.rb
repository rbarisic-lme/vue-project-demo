class AddAboutMeToStylists < ActiveRecord::Migration[6.1]
  def change
    add_column :stylists, :about_me, :text
  end
end
