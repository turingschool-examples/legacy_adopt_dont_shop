class PetApplicationsController < ApplicationController
  def create
    @app = Application.find(params[:application_id])
    @pet_application = PetApplication.new(pet_id: params[:pet_id], application_id: @app.id)
    if @pet_application.valid?
      @pet_application.save
    else
      flash[:notice] = "You already added that pet!"
    end
    redirect_to "/applications/#{@app.id}"
  end
end
