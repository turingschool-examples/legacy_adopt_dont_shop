class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def status
    if params[:approve]
    @application = Application.find(params[:id])
    @pet = Pet.find(params[:approve])
    @pet.update({adoptable: false})
    @application.update({application_status: "approved"})
    redirect_to "/admin/applications/#{@application.id}?approve=yes&pet_id=#{@pet.id}"
    elsif params[:reject]
      @application = Application.find(params[:id])
      @pet = Pet.find(params[:reject])
      @pet.update({adoptable: false})
      @application.update({application_status: "rejected"})
      redirect_to "/admin/applications/#{@application.id}?approve=no&pet_id=#{@pet.id}"
    end
  end
end
