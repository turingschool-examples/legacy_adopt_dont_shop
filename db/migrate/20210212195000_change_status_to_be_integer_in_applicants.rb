class ChangeStatusToBeIntegerInApplicants < ActiveRecord::Migration[5.2]
  def change
    change_column :applicants, :status, :integer, using: 'status::integer'
  end
end
