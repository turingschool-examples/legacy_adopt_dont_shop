class RenameOldTableToNewTable1 < ActiveRecord::Migration[5.2]
  def change
    rename_table :applications_tables, :applications
  end
end
