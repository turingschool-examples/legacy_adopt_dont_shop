class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_alpha
  end
end
