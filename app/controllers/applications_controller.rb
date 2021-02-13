class ApplicationsController < ActionController::Base
  def index
  end

  def show
    @application = Application.find(params[:id])
    @application_pets = ApplicationPet.find_by_application_id(params[:id])
  end

  def new
  end

  def create
    application = Application.create(application_params)
    redirect_to "/applications/#{application.id}"
  end

   private

   def application_params
     params.permit(:first_name, :last_name, :address, :city, :state, :zipcode, :description)
   end
end
