require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    shelter = create(:shelter, id: 1)
    @pet1 = create(:pet, id: 1, shelter_id: 1)
    @pet2 = create(:pet, id: 2, shelter_id: 1)
    @application = create(:application, id: 1)
    @application_pets = create(:application_pet, application_id: 1, pet_id: 1)
    @application_pets2 = create(:application_pet, application_id: 1, pet_id: 2)
  end
  describe 'As a visitor' do
    describe 'When I visit an applications show page' do
      it "I see name of applicant, full address, description, names of pets, and status" do
        visit "/applications/#{@application.id}"

        expect(page).to have_content("Application for #{@application.first_name} #{@application.last_name}")
        expect(page).to have_content("Address: #{@application.address}")
        expect(page).to have_content("City: #{@application.city}")
        expect(page).to have_content("State: #{@application.state}")
        expect(page).to have_content("Zipcode: #{@application.zipcode}")
        expect(page).to have_content("Description: #{@application.description}")
        expect(page).to have_content("Pets' Names:")
        within("div") do
          expect(page).to have_content(@pet1.name)
          expect(page).to have_content(@pet2.name)
        end
        expect(page).to have_content("Application Status: #{@application.capitalized_status}")
      end
    end
  end
end
