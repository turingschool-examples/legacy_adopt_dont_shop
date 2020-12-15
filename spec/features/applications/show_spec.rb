require 'rails_helper'

RSpec.describe "as a visitor" do
  describe 'When I visit an applications show page' do
    it "shows me the application information" do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet_1 = shelter.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      pet_2 = shelter.pets.create!(name: "Fluff Ball", approximate_age: 3, sex: 'male', description: 'super cute')
      application = Application.create!(application_name: "Leah Adoption", street_address: "123 Ridge Parkway", city: "Broomfiled", state: "CO", zip: "80021")

      ApplicationPet.create!(pet_id: pet_1.id, application_id: application.id)

      visit "/applications/#{application.id}"

      expect(page).to have_content(application.application_name)
      expect(page).to have_content(application.street_address)
      expect(page).to have_content(application.city)
      expect(page).to have_content(application.state)
      expect(page).to have_content(application.zip)
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
        # Then I see a section on the page to "Add a Pet to this Application"
        expect(page).to have_content('Add a Pet!')
        expect(page).to have_content("Search")
        # In that section I see an input where I can search for Pets by name
        # When I fill in this field with a Pet's name
        fill_in 'search', with: "#{pet_1.name}"
        # And I click submit,
        click_on 'Submit'
        # Then I am taken back to the application show page
        expect(current_path).to eq("/applications/#{application.id}")
        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("#{pet_1.name}")
        #And under the search bar I see any Pet whose name matches my search
        expect("#{pet_1.name}").to_not appear_before('Search for Pet by Name')
    end

  end
end
