class ChangeUserApplication < ActiveRecord::Migration[5.2]
  def change
  remove_column :user_applicatons, :zip_code
  end
end
