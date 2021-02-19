class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  enum status: ['Pending', 'Approved', 'Rejected']
end
