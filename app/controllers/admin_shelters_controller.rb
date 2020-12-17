class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT name, id FROM Shelters ORDER BY name DESC")
  end
end
