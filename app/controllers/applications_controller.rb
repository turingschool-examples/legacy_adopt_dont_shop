class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    binding.pry
    @application = Application.find(params[:id])
  end

  def new
  end
end
