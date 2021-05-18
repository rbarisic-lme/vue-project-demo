class AddMd5IdentifierToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :md5_identifier, :string
  end
end
