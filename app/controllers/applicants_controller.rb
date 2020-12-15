class ApplicantsController < ApplicationController

    def create
        Applicant.create(applicant_params)
        @applicant = Applicant.last
        @applicant.applications.create!
        @application = Application.last
        redirect_to "/applications/#{@application.id}"
    end

    private
    def applicant_params
        params.permit(:name, :address, :city, :state, :zip)
    end
end
