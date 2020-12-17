class Application < ApplicationRecord
    belongs_to :applicant
    has_many :adoptions
    has_many :pets, through: :adoptions

    # validates_presence_of :description
    enum status: [:"In Progress", :Pending, :Accepted, :Rejected]

    def all_approved
        if self.adoptions.all(status:  true)
            #THATS NOT HOW YOU SEARCH ALL CHILD. USE WHERE. AND OCUNT
            true
        else
            false
        end
    end

    def not_all_approved
        if self.adoptions.any(status:  false)
            true
        else
            false
        end
    end

end
