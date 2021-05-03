class CreateBrandsUsersAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :brands_users do |t|
      t.belongs_to :brand
      t.belongs_to :user
    end
  end
end
