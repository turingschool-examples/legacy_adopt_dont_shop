class RemoveStatusFromApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :status, :string
  end
end
