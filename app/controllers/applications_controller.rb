class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    # require 'pry'; binding.pry
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    Application.create(application_params)
    redirect_to applications_path
  end
end