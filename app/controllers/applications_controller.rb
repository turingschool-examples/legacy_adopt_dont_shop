class ApplicationsController < ApplicationController

    def index
        @applications = Application.all
    end
    
    def show
        @application = Application.find(params[:id])
        @applicant = @application.applicant
    end

    def new
    end

    def create
        Applicant.create(applicant_params)
        @applicant = Applicant.last
        require 'pry'; binding.pry
        @applicant.applications.create(application_params)
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
