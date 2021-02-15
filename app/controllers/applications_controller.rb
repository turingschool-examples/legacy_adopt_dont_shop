class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    if params[:commit] == "Search"
      @search_pets = Pet.search(params[:query])
    end
    if params[:commit] == "Adopt This Pet"
      @pet_to_adopt = Pet.find(params[:pet_id])
      @application.pets << @pet_to_adopt
    end
  end

  def new
  end

  def create
    application = Application.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: "",
      status: "Pending"})
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end
end
