class AddKycVerificationToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kyc_verified_at, :datetime
    add_column :users, :kyc_updated_at, :datetime
    add_column :users, :kyc_denied_at, :datetime
    add_column :users, :kyc_verified_with_workflow, :string
  end
end
