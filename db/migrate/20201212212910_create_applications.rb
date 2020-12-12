class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :description
      t.integer :status, default: 'In Progress'

      t.references :applicant, foreign_key: true

      t.timestamps
    end
  end
end
