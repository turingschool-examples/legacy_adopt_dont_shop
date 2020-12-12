class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    application = Application.create!(name: params[:name], 
                                      address: "#{params[:address]} #{params[:city]}, #{params[:state]} #{params[:zipcode]}",
                                      description: params[:description],
                                      status: params[:status]
                      )
    redirect_to("/applications/#{application.id}")
  end
end