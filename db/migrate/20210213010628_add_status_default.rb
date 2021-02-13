class AddStatusDefault < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :status
    add_column :applications, :status, :integer, :default=> 0
  end
end
