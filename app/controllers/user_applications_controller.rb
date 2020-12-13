class UserApplicationsController < ApplicationController
  def show
    @pet = Pet.all
    @app = UserApplication.find(params[:id])
  end
end