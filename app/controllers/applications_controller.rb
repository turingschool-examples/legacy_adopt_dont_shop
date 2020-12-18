class ApplicationsController < ApplicationController
    def index
        @application = Application.all
    end

    def show
      @application = Application.find(params[:id])
      if params[:search]
        @searched_pets = Pet.where("lower(name) like ?", "%#{params[:search].downcase}%")
      end
    end

    def edit
      @application = Application.find(params[:id])
    end

    def new
    end

    def create
      application = Application.create(applications_params)
      if application.save
        redirect_to "/applications/#{application.id}"
      else
        redirect_to "/applications/new"
        flash[:notice] = "ERROR: Please finish filling out the application before submitting"
      end
    end

    def update
      application = Application.find(params[:id])
      application.update(applications_params)
      if params[:description]
        application.update(status: "Pending")
      end
      redirect_to "/applications/#{application.id}"
    end

    def destroy
      Application.destroy(params[:id])
      redirect_to '/applications'
    end

    # def accept_application_and_adopt_pet(app, pet)
    #   app.update(status: "accepted")
    #   pet.adopted
    #   redirect_to "/admin/applications/#{app.id}"
    # end

    private
    def applications_params
      params.permit(:name, :street_address, :city, :state, :zip, :description, :status)
    end
  end
