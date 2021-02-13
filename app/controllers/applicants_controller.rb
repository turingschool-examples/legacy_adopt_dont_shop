class ApplicantsController < ApplicationController
  def show
    @applicant = Applicant.find(params[:applicant_id])
  end

  def new
  end

  def create
    applicant = Applicant.new(applicant_params)

    applicant.save
    redirect_to "/applicants/#{applicant.id}"
  end
end

private

  def applicant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
