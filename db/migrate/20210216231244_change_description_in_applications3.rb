class ChangeDescriptionInApplications3 < ActiveRecord::Migration[5.2]
  def change
    change_column :applications, :description, :string
  end
end
