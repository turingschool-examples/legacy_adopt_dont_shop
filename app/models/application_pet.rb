class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  def approve
    self[:status] = "Approved"
    save
  end

  def reject
    self[:status] = "Rejected"
    save
  end
end
