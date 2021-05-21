class AddKycIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kyc_id, :string
  end
end
