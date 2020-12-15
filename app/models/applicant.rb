class Applicant < ApplicationRecord
    has_many :applications

    validates_presence_of :name, :address, :city, :state, :zip

    # validates :zip, :length => 5, :format => {with: /[0-9]+/ }
    # validates :state, :length => 2, :format => {with: /[A-Z]+/ }

end
