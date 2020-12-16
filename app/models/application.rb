class Application < ApplicationRecord
    belongs_to :applicant
    has_many :adoptions
    has_many :pets, through: :adoptions

    # validates_presence_of :description
    enum status: [:"In Progress", :Pending, :Accepted, :Rejected]
end
