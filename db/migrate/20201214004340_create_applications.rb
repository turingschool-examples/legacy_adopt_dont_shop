class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :application_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :description

      t.timestamps
    end
  end
end
