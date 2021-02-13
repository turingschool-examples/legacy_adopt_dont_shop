class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street_adress
      t.string :city
      t.string :state
      t.string :zip_code_integer
      t.string :description
    end
  end
end
