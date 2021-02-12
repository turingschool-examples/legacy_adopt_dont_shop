class CreateApplicationPets < ActiveRecord::Migration[5.2]
  def change
    create_table :application_pets do |t|
        t.references :applications, index:true, foreign_key: true
        t.references :pets, index:true, foreign_key: true
    end
  end
end
