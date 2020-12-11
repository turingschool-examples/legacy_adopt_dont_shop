class ApplicationsController < ApplicationController
  def index
    @apps = Application.all
  end

  def new
  end

  def create
    @app = Application.new(application_params)
    binding.pry
    if @app.save
      redirect_to application_path(@app.id)
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  def show
    @app = Application.find(params[:id])
    @pets = Pet.adoptable
    @chosen_ones = @app.chosen_ones
    if params[:application_status] == "Pending"
      @app.update({
        application_status: params[:application_status] })
    else
      if params[:pet_id]
        @selected = Pet.find(params[:pet_id])
      end
      if params[:adopt] && params[:pet_id]
        ApplicationPet.create!(pet: @selected, application: @app)
      end
    end
  end

  def edit
    @app = Application.find(params[:id])
  end

  def update
    app = Application.find(params[:id])
    binding.pry
    app.update(application_params)
    redirect_to application_path(app.id)
  end

  def destroy
    Application.destroy(params[:id])
    redirect_to pets_path
  end

  private

  def application_params
    params.permit(:name, :street, :city, :state, :zip_code, :description)
  end
end
