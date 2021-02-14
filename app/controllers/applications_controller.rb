class ApplicationsController < ApplicationController
  def new
  end

  def show
    @application = Application.find(params[:id])
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Incomplete Application: Required information missing."
      render :new
    end
  end



  private

  def application_params
    params.permit(:first_name, :last_name,:address, :city,
                  :state, :zip, :case_for_adoption, :application_status)
  end
end
