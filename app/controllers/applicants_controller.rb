class ApplicantsController < ApplicationController
  def show
    @applicant = Applicant.find(params[:applicant_id])
    if params[:search]
      @pets = Pet.partial_search(params[:search])
    end
  end

  def new
  end

  def create
    applicant = Applicant.new(applicant_params)

    if applicant.save
      redirect_to "/applicants/#{applicant.id}"
    else
      flash[:notice] = "Applicant not created: Required information missing."
      redirect_to "/applicants/new"
    end
  end

  private

  def applicant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
