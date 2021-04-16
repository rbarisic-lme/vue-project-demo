class CreateLanguagesStylistsAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :languages_stylists do |t|
      t.belongs_to :language
      t.belongs_to :stylist
      t.timestamps
    end
  end
end
