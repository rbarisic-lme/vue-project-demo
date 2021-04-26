class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.string :full_name
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :iban
      t.string :bic

      t.timestamps
    end
  end
end
