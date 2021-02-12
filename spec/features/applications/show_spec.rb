require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'applications/:id" do
    it "Then I can see the following:name, full address, description, name of all pets, application status" do
      before(:each) do
        @application = Factory(:application)
        @application_2 = Factory(:application)
        @pet_1 = Factory(:pet)
        @pet_2 = Factory(:pet)
        @pet_3 = Factory(:pet)
        @pet_4 = Factory(:pet)
      end

      visit "/applications/#{application.id}"

      expect(current_path).to eq("/applications/#{application.id}")
      expect(page).to have_content("Name: #{application.name}")
      expect(page).to have_content("Address: #{application.address}")
      expect(page).to have_content("Description: #{application.description}")
      expect(page).to have_content("Name of all pets: #{application.pets}")
      expect(page).to have_content("Application status:#{application.status}")

    end
    it "visits another applications page" do
      visit "/applications/#{application_2.id}"

      expect(current_path).to eq("/applications/#{application_2.id}")
      expect(page).to have_content("Name: #{application_2.name}")
      expect(page).to have_content("Address: #{application_2.address}")
      expect(page).to have_content("Description: #{application_2.description}")
      expect(page).to have_content("Name of all pets: #{application_2.pets}")
      expect(page).to have_content("Application status:#{application_2.status}")

    end
  end
end



# As a visitor
# When I visit an applications show page
# Then I can see the following:
# - Name of the Applicant
# - Full Address of the Applicant including street address, city, state, and zip code
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pets that this application is for (all names of pets should be links to their show page)
# - The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
