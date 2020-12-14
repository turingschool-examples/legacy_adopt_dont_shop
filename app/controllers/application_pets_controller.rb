class ApplicationPetsController < ApplicationController
  def index
    @pets = Pet.all
  end
end
