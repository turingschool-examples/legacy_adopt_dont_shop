class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:pet_search]
      @pets = Pet.all.search_pet_by_name(params[:pet_search])
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to application_path(application.id)
      flash[:success] = nil
    else 
      flash[:failure] = "Application not created: Required information missing or invalid."
      render :new
    end
  end
  
  def update
    application = Application.find(params[:id])
    if params[:description] == ""
      flash[:failure] = "Enter a valid description"
    else
      application.update(description: params[:description], application_status: "Pending")
    end
    redirect_to application_path(application.id)
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip_code)
  end
end