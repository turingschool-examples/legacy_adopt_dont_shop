class AdoptionsController < ApplicationController

    def create
        # require 'pry'; binding.pry
        adoption = Adoption.new(application_id: params[:app_id], pet_id: params[:pet_id])
        adoption.save
        redirect_to "/applications/#{params[:app_id]}"
    end

    def update
        require 'pry'; binding.pry
        @adoption = Adoption.find(params[:id])
        @adoption.update(adoption_params)
        redirect_to "/admin/applications/#{@adoption.application_id}"
    end

    # def status
    #     @application = Application.find(params[:id])
    #     @adoption = Adoption.find(application_id: @application.id)
    #     if @application.pets.any()
    # end
    private
    def adoption_params
        params.permit(:status)
    end

end