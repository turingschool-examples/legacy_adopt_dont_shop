require 'rails_helper'

RSpec.describe "As a user" do
 describe "when I visit 'applications/new'" do
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
 end
end