class AdminController < ApplicationController
  def index
    @shelters = Shelter.all
    @applications = Application.all
  end
end
