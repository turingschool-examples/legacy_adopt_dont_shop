require 'rails_helper'

RSpec.describe 'Application new page' do
  before :each do
    @application1 = Application.create!(name: "Bercy Hamhands", street_address: "1234 hwat bobby Ave", city: "Denver", state: "CO", zip: 80011, description: "Responsible", status:"In Progress")
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
  end

  it "displays a form to fill to make a new application" do

    visit "/applications/new"

    fill_in "name", with: "Bercy Hamhands"
    fill_in "street_address", with: "1234 hwat bobby Ave"
    fill_in "city", with: "Denver"
    fill_in "state", with: "CO"
    fill_in "zip", with: 80011

    click_button "Submit Application"
    expect(current_path).to eq("/applications/#{Application.last.id}")

    expect(page).to have_content("Name: #{Application.last.name}")
    expect(page).to have_content("Address: #{Application.all.last.street_address}")
    expect(page).to have_content("#{Application.last.city}")
    expect(page).to have_content("#{Application.last.state}")
    expect(page).to have_content("#{Application.last.zip}")
    expect(page).to have_content("Status: #{Application.last.status}")
  end

  it "displays an error message if I fail to fill out the entire form" do

    visit "/applications/new"

    click_button "Submit Application"

    expect(page).to have_content("ERROR: Please finish filling out the application before submitting")

    expect(current_path).to eq("/applications/new")
  end
end
