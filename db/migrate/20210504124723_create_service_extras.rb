class CreateServiceExtras < ActiveRecord::Migration[6.1]
  def change
    create_table :service_extras do |t|
      t.string :name
      t.boolean :requires_trial_date, default: false

      t.timestamps
    end
  end
end
