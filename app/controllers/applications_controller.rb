class ApplicationsController < ApplicationController
    def index
      @applications = Application.all
    end

    def show
      @application = Application.find(params[:id])
    end

    def edit
      @application = Application.find(params[:id])
    end

    def create
      Application.create(applications_params)
      redirect_to '/applications'
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

    private
    def applications_params
      params.permit(:name, :street_address, :city, :state, :zip, :description, :status)
    end
  end
