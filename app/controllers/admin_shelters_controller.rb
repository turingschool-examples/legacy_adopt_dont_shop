class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT name FROM Shelters ORDER BY name DESC")
  end
end
