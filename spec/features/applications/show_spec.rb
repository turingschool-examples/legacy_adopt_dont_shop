require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    @application1 = Application.create!(name: "Bercy Hamhands", street_address: "1234 hwat bobby Ave", city: "Denver", state: "CO", zip: 80011, description: "Responsible", status:"In Progress")
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
  end

  it "displays application w/ corresponding id with attributes and application status" do

    visit "/applications/#{@application1.id}"

    expect(page).to have_content("Name: #{@application1.name}")
    expect(page).to have_content("Address: #{@application1.street_address}")
    expect(page).to have_content("#{@application1.city}")
    expect(page).to have_content("#{@application1.state}")
    expect(page).to have_content("#{@application1.zip}")
    expect(page).to have_content("Pets I Wish to Adopt:")
    expect(page).to have_content("Status: #{@application1.status}")
  end

  it "displays a section where I can search for and add pets to this application." do

    visit "/applications/#{@application1.id}"

    expect(page).to have_content("Add a pet to this application")

    fill_in "search", with: "Rabbid Monster"
    click_button "Search"
    expect(page).to have_content("Rabbid Monster")
  end

  it "displays a section where I can search for pets by a partial name and see results" do

    visit "/applications/#{@application1.id}"

    expect(page).to have_content("Add a pet to this application")

    fill_in "search", with: "Rabbid"
    click_button "Search"
    expect(page).to have_content("Rabbid Monster")
  end

  it "allows me to add a pet to an application after searching" do
  end
end
