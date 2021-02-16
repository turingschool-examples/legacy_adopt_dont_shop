class ApplicationsController < ApplicationController
  def new
  end

  def show
    @application = Application.find(params[:id])
    @searched_pets = Pet.where(name: params[:pet_name])
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
    application = Application.find_by(application_status: "In Progress")
    application.application_status = "Pending"
    application.save
    redirect_to "/applications/#{application.id}"
  end

  private

  def application_params
    params.permit(:first_name, :last_name,:address, :city,
                  :state, :zip, :case_for_adoption, :application_status)
  end
end
