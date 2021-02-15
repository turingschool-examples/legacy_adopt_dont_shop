class AddIsPetApprovedToPetApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_applicants, :is_pet_approved, :boolean
  end
end
