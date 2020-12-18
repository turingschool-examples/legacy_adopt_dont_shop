class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:search_pets]
      @pet_results = Pet.search_pets(params[:search_pets])
    end
  end

  def new
  end

  def create
    @application = Application.new(application_params)
    
    if @application.save
      redirect_to applications_show_path(id: @application.id)
    else
      flash.now[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  def update
    @application = Application.find(params[:id])
    if params[:description] == ""
      flash.now[:notice] = "Invalid description. Try again."
      render :show
    else
      @application.update!(status: "Pending", description: params[:description])
      redirect_to applications_show_path(@application.id)
    end
  end

  private
  def application_params
    params.permit :name, :address, :city, :state, :zip_code, :status, :search
  end
end