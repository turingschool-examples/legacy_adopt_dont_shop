class ChangeUserApplicatonsToUserApplications < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_applicatons, :user_applications
  end
end
