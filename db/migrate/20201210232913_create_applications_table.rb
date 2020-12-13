class CreateApplicationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :applications_tables do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :description
      t.string :application_status
    end
  end
end
