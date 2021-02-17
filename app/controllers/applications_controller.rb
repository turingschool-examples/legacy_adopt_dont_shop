class ApplicationsController < ApplicationController
  def new
  end

  def show
    @application = Application.find(params[:id])
    if params[:pet_name]
      @searched_pets = Pet.pet_name(pet_search_params)
    end
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Incomplete Application: Required information missing."
      render :new
    end
  end

  def update
    application = Application.find(params[:id])
    application.update(application_params)
    application.save
    redirect_to "/applications/#{application.id}"
  end

  private

  def application_params
    params.permit(:first_name, :last_name,:address, :city,
                  :state, :zip, :case_for_adoption, :application_status)
  end

  def pet_search_params
    params.permit(:pet_name)
  end
end
