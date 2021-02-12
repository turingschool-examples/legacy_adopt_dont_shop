class CreateApplicationPets < ActiveRecord::Migration[5.2]
  def change
    create_table :application_pets do |t|
      t.references :application, index:true, foreign_key: true
      t.references :pet, index:true, foreign_key: true

      t.timestamps
    end
  end
end
