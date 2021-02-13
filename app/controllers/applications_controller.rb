class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    @application = Application.create(app_params)
    @application.update(status: "In Progress")

    if app_params.values.any?(&:empty?)
      flash[:notice] = "Required fields missing"
      render :new
    else
      @application.save
      redirect_to "/applications/#{@application.id}"
    end
  end

  private

  def app_params
    params.permit(:name, :street_address, :city, :state, :zipcode)
  end
end
