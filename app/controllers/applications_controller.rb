class ApplicationsController < ApplicationController
  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to application_path(application)
    else
      flash[:notice] = "#{application_params.keys.find {|k| application_params[k]==""}.humanize} is a required field."
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])
    @adoptable_pets = Pet.search(params[:search]) if params[:search]
  end

  private
  def application_params
    params[:application].permit(:applicant_name, :street_address, :city, :state, :zip)
  end
end
