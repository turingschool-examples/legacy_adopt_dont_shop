class ChangeStatusFromUserApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :user_applications, :status, default: "In Progress"
  end
end
