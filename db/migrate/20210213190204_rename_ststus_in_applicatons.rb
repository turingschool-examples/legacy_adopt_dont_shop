class RenameStstusInApplicatons < ActiveRecord::Migration[5.2]
  def change
    rename_column(:applications, :ststus, :status)
  end
end
