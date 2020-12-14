class ApplicationsController < ApplicationController
    def index
      @pet = Pet.find(params[:id])
    end

    def show
      @application = Application.find(params[:id])
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
      redirect_to "/applications/#{application.id}"
    end

    def destroy
      Application.destroy(params[:id])
      redirect_to '/applications'
    end

    def search
      if params[:search].blank?
        redirect_to(root_path, alert: "Empty field!") and return
      else
        @parameter = params[:search].downcase
        @results = Pet.all.where("lower(name) LIKE :search", search: @parameter)
    end

    private
    def applications_params
      params.permit(:name, :street_address, :city, :state, :zip, :description, :status)
    end
  end
