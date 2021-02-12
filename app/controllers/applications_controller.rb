class ApplicationsController < ActionController::Base
  def show
    @application = Application.find(params[:id])
    @application_pets = ApplicationPet.find_by_application_id(params[:id])
  end

  def status
  end
end
