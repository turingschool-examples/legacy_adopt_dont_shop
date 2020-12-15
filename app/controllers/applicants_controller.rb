class ApplicantsController < ApplicationController
    
    def index
        @applicants = Applicant.all
    end

    def show
        @applicant = Applicant.find(params[:id])
    end
    
    def new
    end

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

    private
    def application_params
        params.permit(:description, :status)
    end
end
