class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      render "/applications/new"
    end
  end
end

private
def application_params
  params[:application].permit(:name, :address, :city, :state, :zip, :description)
end