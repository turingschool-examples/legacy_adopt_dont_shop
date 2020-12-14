class ApplicationsController < ApplicationController

    def show
        @application = Application.find(params[:id])
        @applicant = Applicant.find(@application.applicant_id)
    end

end
