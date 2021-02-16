class PetsController < ApplicationController
  before_action :find_pet, only: [:show, :edit, :update]

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def index
    @pets = Pet.all
  end

  def update
    @pet.update(pets_params)
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private
  def pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoptable)
  end
end
