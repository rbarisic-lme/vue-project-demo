class AddEmailConfirmedAtToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :email_confirmed_at, :datetime
  end
end
