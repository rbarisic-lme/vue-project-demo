class AddKycPendingtoUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kyc_pending, :boolean
  end
end
