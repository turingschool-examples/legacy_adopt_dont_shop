class ApplicationsController < ActionController::Base

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  private
  def applications_params
    params.permit(:applicant_name, :applicant_address, :city, :state, :zip, :description, :status)
  end
end
