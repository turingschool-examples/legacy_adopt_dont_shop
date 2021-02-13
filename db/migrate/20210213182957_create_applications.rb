class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name_of_applicant
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :case_for_adoption
      t.string :adoptable_pet_names
      t.boolean :application_status
    end
  end
end
