class ApplicantsController < ApplicationController

    def create
        @applicant = Applicant.new(applicant_params)
        if @applicant.save
            @applicant.applications.create!
            @application = Application.last
            redirect_to "/applications/#{@application.id}"
        else
            redirect_to "/applications/new", alert: @applicant.errors.full_messages
        end
    end

    private
    def applicant_params
        params.permit(:name, :address, :city, :state, :zip)
    end
end
