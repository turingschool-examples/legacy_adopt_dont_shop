class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if params[:search]
      # find_pets
      keyword = "%#{params[:search].downcase}%"
      @available_pets = Pet.where("lower(name) LIKE ?", keyword)
    end
  end

  def new
  end

  def create
    @application = Application.new(application_attributes)

    if @application.save
      redirect_to("/applications/#{@application.id}")
    else
      flash[:errors] = @application.errors
      render :new
    end
  end

  def add_pet
    pet = Pet.find(params[:pet_id])
    app = Application.find(params[:id])
    PetApplication.create!(pet: pet, application: app)

    redirect_to "/applications/#{params[:id]}?search=#{params[:search]}"
  end

  def update
    @application = Application.find(params[:id])
    @application.update({
      description: params[:description],
      status: "Submitted"
      })

    redirect_to "/applications/#{params[:id]}"
  end

  private

  def application_attributes
    {
      name: params[:name],
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: params[:description],
      status: "In Progress"
    }
  end

  def find_pets
  end
end
