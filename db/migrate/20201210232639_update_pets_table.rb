class UpdatePetsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :sex
    add_column :pets, :sex, :string
  end
end
