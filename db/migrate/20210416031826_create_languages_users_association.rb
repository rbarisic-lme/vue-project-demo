class CreateLanguagesUsersAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :languages_users do |t|
      t.belongs_to :language
      t.belongs_to :user
      t.timestamps
    end
  end
end
