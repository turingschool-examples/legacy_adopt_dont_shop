class ApplicationsController < ApplicationController
  def show
    @pets = Pet.search(params[:search]) if params[:search]
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
  @application = Application.new(app_params)
  @application.update(application_status: "In Progress")

    if @application.save
      flash[:success] = "Create Application performed successfully"
      redirect_to "/applications/#{@application.id}"
    else
      flash[:warning] = "Create New Application failed, Please complete all fields"
      redirect_to :action => "new"
    end
  end

  def update
    application = Application.find(params[:id])
    application.update(params[:pet_id])
    redirect_to "/applications/#{application.id}"
  end

  private

  def app_params
    params.permit(:name, :street_address,
    :city, :state, :zip_code, :description_of_applicant,
    :pet_name, :application_status)
  end
end
