class ApplicationsController < ActionController::Base
  def show
    @application = Application.find(params[:id])
    @application_pets = ApplicationsPets.find_by_application_id(params[:id])
  end
end
