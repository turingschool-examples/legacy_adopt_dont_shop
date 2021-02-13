class CreateApplicationTable < ActiveRecord::Migration[5.2]
  def change
    create_table :application_tables do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :description
      t.string :status
    end
  end
end
