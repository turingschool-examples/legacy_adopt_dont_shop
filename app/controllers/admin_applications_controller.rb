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
    redirect_to "/admin/applications/#{@application.id}?approve=#{@pet.id}"
    elsif params[:reject]
      redirect_to "/admin/applications/#{@application.id}?approve=#{@pet.id}"
    end
  end
end
