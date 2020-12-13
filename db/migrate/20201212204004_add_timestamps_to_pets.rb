class AddTimestampsToPets < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:pets)
  end
end
