class CreateCertifications < ActiveRecord::Migration[6.1]
  def change
    create_table :certifications do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :body
      t.string :certified_by
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
