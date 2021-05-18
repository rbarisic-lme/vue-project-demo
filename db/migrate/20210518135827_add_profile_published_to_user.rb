class AddProfilePublishedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile_published, :boolean, default: false
  end
end
