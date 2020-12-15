class ApplicationsController < ApplicationController

    def show
        @application = Application.find(params[:id])
        # @applicant = @application.applicant
    end
    
end
