class AddInvoiceMandateAcceptedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :invoice_mandate_accepted, :boolean
  end
end
