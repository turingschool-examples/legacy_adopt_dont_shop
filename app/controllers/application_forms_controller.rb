class ApplicationFormsController < ApplicationController
  def index
    @applications = ApplicationForm.all
  end

  def show
    @application = ApplicationForm.find(params[:id])
  end

  def new

  end 
end
