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
    application = Application.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: params[:description]
      })
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "You must fill out all fields in form"
      redirect_to "/applications/new"
    end
  end

  # def index
  #
  # end
end
