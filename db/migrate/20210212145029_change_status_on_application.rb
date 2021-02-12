class ChangeStatusOnApplication < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :status
    add_column :applications, :status, :integer
  end
end
