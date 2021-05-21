class AddEMailVerificationTokenToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :email_verification_token, :string
  end
end
