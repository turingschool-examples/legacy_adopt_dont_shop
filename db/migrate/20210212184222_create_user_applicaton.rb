class CreateUserApplicaton < ActiveRecord::Migration[5.2]
  def change
    create_table :user_applicatons do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :description
      t.string :status
    end
  end
end
