class AddEncryptedIbanToBankAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :bank_accounts, :encrypted_iban, :string
    add_column :bank_accounts, :encrypted_iban_iv, :string
  end
end
