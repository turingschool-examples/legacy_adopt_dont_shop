require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter",
                                address: "123 Shady Ave",
                                city: "Denver",
                                state: "CO",
                                zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"",
                                   name: "Thor",
                                   description: "dog",
                                   approximate_age: 2,
                                   sex: "male")
    @pet2 = @shelter1.pets.create!(image:"",
                                   name: "Athena",
                                   description: "cat",
                                   approximate_age: 3,
                                   sex: "female")
    @application_1 = Application.create!(name: "Sally",
                                         address: "234 Third Ave",
                                         city: "Dallas",
                                         state: "TX",
                                         zip: 88678,
                                         description: "I would be a great dog mom!")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet1.id, status: "Pending")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet2.id, status: "Pending")
  end

  it 'displays application w/ id and all attributes' do

    visit "/applications/#{@application_1.id}"

    expect(page).to have_content("#{@application_1.name}'s application:")
    expect(page).to have_content("Address: #{@application_1.address}")
    expect(page).to have_content("City: #{@application_1.city}")
    expect(page).to have_content("State: #{@application_1.state}")
    expect(page).to have_content("Zip: #{@application_1.zip}")
    expect(page).to have_content("Description: #{@application_1.description}")
    expect(page).to have_content('Pets applied for:')
    application_1.pets.each do |pet|
      expect(page).to have_content(pet.name)
    end 
  end
end
