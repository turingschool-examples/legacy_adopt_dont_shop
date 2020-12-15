class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:commit]
      @selected = Pet.where(name: params[:search])
    end
    if params[:adopt]
      chosen = Pet.find(params[:pet_id])
      pet_app = PetApplication.create!(pet_id: chosen.id, application_id: @application.id)
    end
  end

  def new
  end

  def create
    application = Application.new(application_name: params[:application_name], street_address: params[:street_address], city: params[:city], state: params[:state], zip: params[:zip])
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:error] =  "You must fill in the fields."
      redirect_to "/applications/new"
    end
  end
end
