class ApplicantsController < ApplicationController

  def show
    @applicant = Application.find(params[:applicant_id])
  end
end
