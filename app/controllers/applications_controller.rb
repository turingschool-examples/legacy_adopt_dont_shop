class ApplicationsController < ApplicationController
	 def index
    @applications = Application.all
  end

  def new
  end

  def show
  	@application = Application.find(params[:id])
  end

  def create
  	  application = Application.new(application_params)
 			if application.save
        redirect_to "/applications/#{application.id}"
      else
        flash.now[:notice] = 'Missing fields, please fill in all info.'
        render :new
      end
      
      
     
  end



  private
  def application_params
    params.permit(:name,:street, :city, :state, :zip)
  end
end