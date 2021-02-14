class ApplicationsController < ApplicationController

  def new
  end

  def show
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.create(application_params)
    if !@application.save
      flash[:notice] = "Your application was not saved. Please fill in all application fields."
      # render :new
      redirect_to '/applications/new'
    else @application.save
      flash[:notice] = "Your has been saved!"
      redirect_to "/applications/#{@application.id}"
    end
  end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip, :description)
  end
end
