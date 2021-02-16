class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @application_pets = PetApplication.where(application_id: "#{@application.id}")
    if params[:search]
      keyword = "%#{params[:search]}%"
      @available_pets = Pet.where("name LIKE ?", keyword)
    end
  end

  def new
  end

  def create
    application = Application.new({
      name: params[:name],
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: params[:description],
      status: "In Progress"
      })

    application.save
    redirect_to("/applications/#{application.id}")
  end

  def add_pet
    pet = Pet.find(params[:pet_id])
    app = Application.find(params[:id])
    PetApplication.create!(pet: pet, application: app)

    redirect_to "/applications/#{params[:id]}?search=#{params[:search]}"
  end
end
