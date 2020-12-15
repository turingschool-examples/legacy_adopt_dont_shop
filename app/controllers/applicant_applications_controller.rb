class ApplicantApplicationController < ApplicationController

    def new
        @applicant = Applicant.find(params[:applicant_id])
    end

    def create
        @applicant = Applicant.find(params[:applicant_id])
        @application = @applicant.application.create(applicant_application_params)
        redirect_to "/applications/#{@application.id}"    
    end

    private
    def applicant_application_params
        params.permit(:description, :status)
    end

end