class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :email
      t.text :body
      t.decimal :rating_quality
      t.decimal :rating_timeliness
      t.decimal :rating_communication
      t.decimal :overall_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
