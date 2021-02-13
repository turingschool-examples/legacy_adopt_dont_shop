class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :applicants, :status, 0
  end
end
