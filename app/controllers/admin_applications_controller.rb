class AdminApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if @application.status == "Pending"
      @application.approved?
    end
  end

  def update_pet
    @application = Application.find(params[:id])

    @record = PetApplication.where(pet_id: params[:pet_id], application_id: params[:application_id])
    @record.update(approved: (params[:approved] == "true"))

    redirect_to "/admin/applications/#{@application.id}"
  end
end
