# class ApplicantApplicationsController < ApplicationController
    
#     def index
#       @applicant = Applicant.find(params[:applicant_id])
#     end
      
#     def new
#         @applicant = Applicant.find(params[:applicant_id])
#     end
      
#     def create
#         @applicant = Applicant.find(params[:applicant_id])
#         @applicant.applications.create!(applicant_applications_params)
#         @application = Application.last
#         redirect_to "/applications/#{@application.id}"
#     end
      
#     private
#     def applicant_applications_params
#         params.permit(:description, :status)
#     end
# end
