class AddZipCodeToUserApplicaton < ActiveRecord::Migration[5.2]
  def change
    add_column :user_applicatons, :zip_code, :integer
  end
end
