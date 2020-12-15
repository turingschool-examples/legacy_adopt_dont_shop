class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def submit
    application = Application.find(params[:id])
    application.status = "Pending"
    application.save
    redirect_to "/applications/#{application.id}"
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @application.description = params[:description]
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      @application = Application.find(params[:id])
      flash.now[:error] = @application.errors.full_messages.first
      require "pry"; binding.pry
      render :edit
    end
  end
end
