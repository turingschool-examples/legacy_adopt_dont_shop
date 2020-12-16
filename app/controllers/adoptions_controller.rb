class AdoptionsController < ApplicationController

    def create
        # require 'pry'; binding.pry
        adoption = Adoption.new(application_id: params[:app_id], pet_id: params[:pet_id])
        adoption.save
        redirect_to "/applications/#{params[:app_id]}"
    end

end