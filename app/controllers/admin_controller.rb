class AdminController < ApplicationController
  def index
    @shelters = Shelter.all
    @applications = Application.where('application_status <> ?', "In Progress")
  end
end
