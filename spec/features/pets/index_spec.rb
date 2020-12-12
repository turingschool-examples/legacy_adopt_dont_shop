require 'rails_helper'

RSpec.describe 'Pets index page' do
  before :each do
    @application1 = Application.create!(name: "Bercy Hamhands", street_address: "1234 hwat bobby Ave", city: "Denver", state: "CO", zip: 80011, description: "Responsible", status:"In Progress")
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
  end

  it "displays each pet in the system with attributes" do

    visit "/pets"

    expect(page).to have_content(@pet1.image)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@shelter1.name)

    expect(page).to have_content(@pet2.image)
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.approximate_age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@shelter2.name)

    expect(page).to_not have_content(@shelter3.name)
  end

  it "can delete a pet from pet index page" do
    visit "/pets"

    within "#pet-#{@pet1.id}" do
      expect(page).to have_content("Thor")
      click_link "Delete Pet"
    end

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Thor")
  end

  it "can edit a pet from pets index page" do
    visit '/pets'

    within "#pet-#{@pet1.id}" do
      expect(page).to have_content("Thor")
      click_link "Update Pet"
    end

    fill_in "name", with: "Calvin"

    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{@pet1.id}")

    expect(page).to have_content("Calvin")
    expect(page).to_not have_content("Thor")
  end

  it "has a link to start an application on the new application page" do
    visit '/pets'

    expect(page).to have_content("Start an Application")
    click_link "Start an Application"

    fill_in "name", with: "Bercy Hamhands"
    fill_in "street_address", with: "1234 hwat bobby Ave"
    fill_in "city", with: "Denver"
    fill_in "state", with: "CO"
    fill_in "zip", with: 80011
    fill_in "description", with: "Responsible"

    click_button "Submit Application"

    expect(current_path).to eq("/applications/#{@application1.id}")

    expect(page).to have_content("Name: #{@application1.name}")
    expect(page).to have_content("Address: #{@application1.street_address}")
    expect(page).to have_content("#{@application1.city}")
    expect(page).to have_content("#{@application1.state}")
    expect(page).to have_content("#{@application1.zip}")
    expect(page).to have_content("Description: #{@application1.description}")
    expect(page).to have_content("Status: #{@application1.status}")
  end
end
