class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state, :limit => 2
      t.string :zip, :limit => 5

      t.timestamps
    end
  end
end
