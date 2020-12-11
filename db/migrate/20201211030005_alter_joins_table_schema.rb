class AlterJoinsTableSchema < ActiveRecord::Migration[5.2]
  def change
    drop_join_table(:application, :pets)
    create_table :application_pets do |t|
      t.references :pet, foreign_key: true
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
