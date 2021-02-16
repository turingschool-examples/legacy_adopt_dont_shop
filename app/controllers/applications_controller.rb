class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if params.include?(:search_pets)
      @search = Pet.where("lower(name) LIKE ?", "%#{params[:search_pets].downcase}%")
    else
      @search = []
    end
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.new(app_params)
    if application.save
      redirect_to"/applications/#{application.id}"
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  def add_pet
    @application = Application.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    ApplicationPet.create(application: @application, pet: @pet)
    redirect_to "/applications/#{@application.id}"
  end

  def submit_app
    @application = Application.find(params[:id])
    @application.assign_attributes(status: "Pending", description: params[:description])
    @application.save
    redirect_to "/applications/#{@application.id}"
  end

  private
  def app_params
    params.permit(:name, :street_address, :city, :state, :zip, :description)
  end
end