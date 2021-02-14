class AdminSheltersController < ApplicationController
  def index
    @shelter = Shelter.all
  end
end
