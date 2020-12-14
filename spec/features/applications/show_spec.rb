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
  end
end
