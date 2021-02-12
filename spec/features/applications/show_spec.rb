require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    ApplicationsPets.destroy_all
    Pet.destroy_all
    Shelter.destroy_all
    Application.destroy_all

    @shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
    @pet1 = @shelter.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
    @pet2 = @shelter.pets.create!(name: "Princess", approximate_age: 2, sex: 'female', description: 'super cute')
    @application = Application.create!(first_name: 'Jenny', last_name: 'Branham',
                                      address: '123 Adoption Ln.', city: 'Denver',
                                      state: 'CO', zipcode: '80222',
                                      description: 'description of application', status: 'in_progress')
    @application_pets = ApplicationsPets.create!(application_id: @application.id, pet_id: @pet1.id)
    @application_pets2 = ApplicationsPets.create!(application_id: @application.id, pet_id: @pet2.id)
  end
  describe 'As a visitor' do
    describe 'When I visit an applications show page' do
      # it "I see name of applicant, full address, description, names of pets, and status" do
      #   visit "/applications/#{@application.id}"
      #
      #   expect(page).to have_content("Application for #{@application.first_name} #{@application.last_name}")
      #   expect(page).to have_content("Address: #{@application.address}")
      #   expect(page).to have_content("City: #{@application.city}")
      #   expect(page).to have_content("State: #{@application.state}")
      #   expect(page).to have_content("Zipcode: #{@application.zipcode}")
      #   expect(page).to have_content("Description: #{@application.description}")
      #   expect(page).to have_content("Pets' Names: #{@pet1.name}, #{@pet2.name}")
      #   expect(page).to have_content("Application Status: #{@application.status}")
      # end
    end
  end
end
