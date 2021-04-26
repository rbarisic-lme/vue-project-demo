class AddOwnerIdToBankAccount < ActiveRecord::Migration[6.1]
  def change
    add_reference :bank_accounts, :owner, polymorphic: true
  end
end
