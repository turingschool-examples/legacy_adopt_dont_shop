class ApplicationsController < ApplicationController

    def show
        @application = Application.find(params[:id])
        @pets = Pet.search(params[:search])
    end
    
end
