class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :description, :default => "Why should you be able to adopt this pet?"
      t.string :status, default: "In Progress"

      t.timestamps
    end
  end
end
