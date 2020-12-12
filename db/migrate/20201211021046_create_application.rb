class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :applicant_name
      t.string :applicant_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :description
    end
  end
end
