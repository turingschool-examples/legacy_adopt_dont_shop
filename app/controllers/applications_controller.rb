class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:search]
      @pets = Pet.where("name ILIKE :name", name:"%#{params[:search]}")
    end
  end

  def new

  end

  def create
    application = Application.new(app_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash.now[:notice] = "You must fill out all fields in form"
      render :new
    end
  end

  # def index
  #
  # end
  
  private
    def app_params
      params.permit(:name, :address, :city, :state, :zip, :description)
    end
end
