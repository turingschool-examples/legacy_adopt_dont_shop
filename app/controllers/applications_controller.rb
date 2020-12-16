class ApplicationsController < ApplicationController

    def show
        @application = Application.find(params[:id])
        @pets = Pet.search(params[:search])
        # require 'pry'; binding.pry
        @chosen_ones = @application.pets
        # # if params[:search]
        # # end
        # # if params[:adopt]
        # #     wanted = Pet.find(params[:pet_id])
        # #     pet_app = PetApplication.create!()
        # # end
    end

    def edit
        @application = Application.find(params[:id])
    end
    
    def update
        @application = Application.find(params[:id])
        @application.update(application_params)
        require 'pry'; binding.pry
        redirect_to "/applications/#{@application.id}"
    end

    private
    def application_params
        params.permit(:status, :description, :pets)
    end

end
