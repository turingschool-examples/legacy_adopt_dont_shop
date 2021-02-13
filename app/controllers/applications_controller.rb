class ApplicationsController < ActionController::Base
  def index
  end

  def show
    @application = Application.find(params[:id])
    @application_pets = ApplicationPet.find_by_application_id(params[:id])
    if params[:pet_name]
      @pet = Pet.find_by_name(params[:pet_name])
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Application not created: Required information missing."
      render "/applications/new"
end
  end

   private

   def application_params
     params.permit(:first_name, :last_name, :address, :city, :state, :zipcode, :description)
   end
end
