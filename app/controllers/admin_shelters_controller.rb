class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT name, id FROM Shelters ORDER BY name DESC")
    @pending_shelters = Shelter.pending_shelters
  end

  def show
    @shelter = Shelter.find_by_sql("SELECT name, address, city, state, zip FROM Shelters WHERE id = '#{params[:id]}'").first
  end
end
