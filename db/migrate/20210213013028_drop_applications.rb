class DropApplications < ActiveRecord::Migration[5.2]
  def change
    drop_table :application_tables
  end
end
