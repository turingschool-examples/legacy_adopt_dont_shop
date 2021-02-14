class ApplicationsController < ApplicationController
  def index
    # @applications = Application.all
  end

  def show

    @application = Application.find(params[:id])

  end

  def new
    # @application = Application.new
  end

  # def create
  #   application = Application.new({
  #     name: params[:name],
  #     address: params[:address],
  #     city: params[:city],
  #     zip: params[:zip]
  #     })
  #     application.save!
  #     redirect_to "/applications/show/#{application.id}"
  # end

  def create
    application = Application.create(application_params)
    application.save!
    redirect_to "/applications/show/#{application.id}"
  end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
