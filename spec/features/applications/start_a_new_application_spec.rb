require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit 'applications/new'" do
    before :each do
      @shelter1 = Shelter.create(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
      @shelter3 = Shelter.create(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
      @pet1 = @shelter1.pets.create(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter2.pets.create(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter1.pets.create(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    end

    it "I can start a new application" do
      visit "/applications/new"

      fill_in "Name:", with: "Billy Bob"
      fill_in "Street address:", with: "123 W Street"
      fill_in "City:", with: "Denver"
      fill_in "State (abbr):", with: "CO"
      fill_in "Zip code:", with: "80246"
      click_button "Submit"

      expect(current_path).to include("/applications/")
    end

    it "I cannot create an application with an empty form" do
      visit applications_new_path

      click_on "Submit"

      expect(page).to have_content("Application not created: Required information missing.")
      expect(page).to have_button("Submit")
    end

    it "I cannot create an application without an address" do
      visit applications_new_path

      fill_in "Name:", with: "Billy Bob"
      click_button "Submit"
      
      expect(page).to have_content("Application not created: Required information missing.")
      expect(page).to have_button("Submit")
    end

    it "I can not create an application without a name" do
      visit applications_new_path

      fill_in "Street address:", with: "123 W Street"
      fill_in "City:", with: "Denver"
      fill_in "State (abbr):", with: "CO"
      fill_in "Zip code:", with: "80246"
      click_button "Submit"

      expect(page).to have_content("Application not created: Required information missing.")
      expect(page).to have_button("Submit")
    end
  end
end