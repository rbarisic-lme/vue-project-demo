class CreateStylistSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :stylist_skills do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
