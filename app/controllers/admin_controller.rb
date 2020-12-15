class AdminController < ApplicationController
  def index
    binding.pry
    @shelters = Shelter.all.order('name ASC')
    @applications = Application.where('application_status <> ?', "In Progress")
    session[:secret] = "This time for real, though."

  end
end
