class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT name, id FROM Shelters ORDER BY name DESC")
  end

  def show
    @shelter = Shelter.find_by_sql("SELECT name, address, city, state, zip FROM Shelters WHERE id = '#{params[:id]}'")
  end
end
