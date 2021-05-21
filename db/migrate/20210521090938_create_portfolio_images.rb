class CreatePortfolioImages < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_images do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
