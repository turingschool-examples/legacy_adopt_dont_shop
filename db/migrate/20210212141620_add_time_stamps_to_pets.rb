class AddTimeStampsToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :created_at, :datetime, null: false
    add_column :pets, :updated_at, :datetime, null: false
  end
end
