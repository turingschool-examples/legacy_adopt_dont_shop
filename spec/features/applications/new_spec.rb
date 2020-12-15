require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when i am on the new application page' do
    it 'allows me to create a new application via filling a form' do
      visit '/pets'
      click_link "Start an Application"
      expect(current_path).to eq("/applications/new")

      fill_in "name", with: "Julia Bloom"
      fill_in "street_address", with: "514 Old Street"
      fill_in "city", with: "Briancliffe"
      fill_in "state", with: "New York"
      fill_in "zip", with: "29"
      click_button "Submit"
# how do we know where to do with no primary_id established as the recored has not been saved?
# by the time the test has run the morst recent obj will have been made, so below works
      expect(current_path).to eq("/applications/#{Application.last.id}")
    end

      it 'Starting an Application, Form not Completed' do
        # As a visitor
        # When I visit the new application page
        visit '/applications/new'
        # And I fail to fill in any of the form fields
        # And I click submit
        click_button "Submit"
        # Then I am taken back to the new applications page
        expect(current_path).to eq("/applications/new")
        # And I see a message that I must fill in those fields.
        expect(page).to have_content("You must fill in the fields.")  # TODO: investigate why this is not passing
    end

    it "Searching for Pets for an Application" do
        application = Application.create!(application_name: "Leah Adoption", street_address: "123 Ridge Parkway", city: "Broomfiled", state: "CO", zip: "80021")
        shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
        pet_1 = shelter.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
        # As a visitor
        # When I visit an application's show page
        visit "/applications/#{application.id}"
        # And that application has not been submitted,
        expect(ApplicationPet.all).to eq([])
        require "pry"; binding.pry
        save_and_open_page
        # Then I see a section on the page to "Add a Pet to this Application"
        expect(page).to have_content("Add a Pet to this Application")
# In that section I see an input where I can search for Pets by name
# When I fill in this field with a Pet's name
# And I click submit,
# Then I am taken back to the application show page
# And under the search bar I see any Pet whose name matches my search
    end
  end
end
