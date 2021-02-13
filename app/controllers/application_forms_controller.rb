class ApplicationFormsController < ApplicationController
  def index
    @index = ApplicationForm.all
  end
end 
