class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.references :application, foreign_key: true
      t.references :pet, foreign_key: true
    end
  end
end
