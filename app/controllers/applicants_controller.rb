class ApplicantsController < ApplicationController
    
    def create
        Applicant.create(applicant_params)
    end

    private
    def applicant_params
        params.permit(:name, :address, :city, :state, :zip)
    end

end
