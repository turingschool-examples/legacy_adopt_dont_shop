class ChangeDefaultInApplications < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:applications, :description, nil)
  end
end
