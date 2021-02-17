require 'rails_helper'

RSpec.describe "Application show page", type: :feature do
  before :each do
    Application.destroy_all

    @application1 = Application.create!(name: "Peter Smith", address: "123 Main Ave", city: "Denver", state: "CO", zip: 80011, description: "Love pets")
  end
  describe "as a Visitor" do
    describe "when I visit the show page for specific application" do
      it "displays all the applicant attributes" do
        visit "/applications/#{@application1.id}"

        expect(page).to have_content(@application1.name)
        expect(page).to have_content(@application1.address)
        expect(page).to have_content(@application1.city)
        expect(page).to have_content(@application1.state)
        expect(page).to have_content(@application1.zip)
        expect(page).to have_content(@application1.description)
        expect(page).to have_content(@application1.status)
      end
    end

    describe "it has section to add pet to application" do
      it "returns a list of pets by searching a name" do
        visit "/applications/#{@application1.id}"
        shelter = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
        pet = shelter.pets.create!(image:"", name: "Sparky", description: "dog", approximate_age: 2, sex: "male")

        expect(page).to have_content("Add a Pet to this Application")
        fill_in "pet_name", with: "Sparky"
        click_on "Submit"
        expect(current_path).to eq("/applications/#{@application1.id}")
        expect(page).to have_content("Sparky")
        expect(page).to_not have_content("Thor")
      end

      it "has link to add pet after searching for pet name" do
        visit "/applications/#{@application1.id}"
        shelter = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
        pet = shelter.pets.create!(image:"", name: "Sparky", description: "dog", approximate_age: 2, sex: "male")

        fill_in "pet_name", with: "Sparky"
        click_on "Submit"
        expect(page).to have_content("Sparky")
        expect(page).to have_link("Adopt this Pet")
      end
      it "can adopt pets by clicking the adopt link" do
        visit "/applications/#{@application1.id}"
        shelter = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
        pet = shelter.pets.create!(image:"", name: "Sparky", description: "dog", approximate_age: 2, sex: "male")

        fill_in "pet_name", with: "Sparky"
        click_on "Submit"

        expect(page).to have_link("Adopt this Pet")
        click_on "Adopt this Pet"
        expect(current_path).to eq("/applications/#{@application1.id}")
        expect(page).to have_content("Pets to Adopt")
      end
    end
  end
end