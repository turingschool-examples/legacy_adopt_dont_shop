require 'rails_helper'

# Applications can be "In Progress", "Pending", "Accepted", or "Rejected"
RSpec.describe 'As a user' do
  describe "when I visit the Application show page" do
    let!(:shelter1) do
      Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    end
    let!(:shelter2) do
      Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    end
    let!(:shelter3) do
      Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    end
    let!(:pet1) do
     shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    end
    let!(:pet2) do
      shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    end
    let!(:pet3) do
      shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    end
    let!(:application) do
      Application.create!(name: 'Billy Bob', 
        address: '123 W Street, Denver, CO 80246',
        description: "I love animals.",
        status: "Pending"
        )
    end
    let!(:pet_application1) do
      PetApplication.create!(application: application, pet: pet1)
    end
    let!(:pet_application2) do
      PetApplication.create!(application: application, pet: pet3)
    end

    it "should show application details" do
      visit "/applications/#{application.id}"

      expect(page).to have_content(application.name)
      expect(page).to have_content(application.address)
      expect(page).to have_content(application.description)
      expect(page).to have_content("Application Status: #{application.status}")
      expect(page).to have_link(pet1.name, href: "/pets/#{pet1.id}")
      expect(page).to have_link(pet3.name, href: "/pets/#{pet3.id}")
      expect(page).not_to have_link(pet2.name, href: "/pets/#{pet2.id}")
    end
  end
end