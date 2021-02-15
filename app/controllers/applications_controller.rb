class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(name: params[:application][:name], address: params[:application][:address], city: params[:application][:city], state: params[:application][:state], zip: params[:application][:zip], description: params[:application][:description])
    @application.save
    redirect_to "/applications/#{@application.id}"
  end
end