class CreateApplicationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :application_forms do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.text :description
      t.boolean :reviewed
      t.boolean :accepted
      t.timestamps
    end
  end
end
