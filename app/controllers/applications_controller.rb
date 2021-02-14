class ApplicationsController < ApplicationController
  def show
    @applications = Application.all
    @application = Application.find(params[:id])
    # require "pry"; binding.pry
  end

  # def index
  #   @applications = Application.all
  # end
end
