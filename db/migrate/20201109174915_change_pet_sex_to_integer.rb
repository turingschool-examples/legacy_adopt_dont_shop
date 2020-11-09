class ChangePetSexToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :sex
    add_column :pets, :sex, :integer
  end
end
