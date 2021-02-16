class UserApplicationsController < ApplicationController

  def show
    @app = UserApplication.find(params[:id])
  end

  def new

  end

  def create

  end

end
