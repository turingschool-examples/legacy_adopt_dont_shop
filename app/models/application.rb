require 'factory_bot'

class Application < ApplicationRecord
    belongs_to :applicant
    has_many :application_pets
    has_many :pets, through: :application_pets

    # validates_presence_of :description
    enum status: [:"In Progress", :Pending, :Accepted, :Rejected]
end
