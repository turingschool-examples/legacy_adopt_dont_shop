class AddTimeStampsToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :created_at, :datetime, null: false
    add_column :shelters, :updated_at, :datetime, null: false
  end
end
