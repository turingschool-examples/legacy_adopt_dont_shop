class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  # def update
  #   @application = Application.find(params[:id])
  #   @application.update({
  #     status: "Approved"})
  #   redirect_to "/admin/applications/#{@application.id}"
  # end
end
