require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter",
                                address: "123 Shady Ave",
                                city: "Denver",
                                state: "CO",
                                zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"",
                                   name: "Thor",
                                   description: "dog",
                                   approximate_age: 2,
                                   sex: "male")
    @pet2 = @shelter1.pets.create!(image:"",
                                   name: "Athena",
                                   description: "cat",
                                   approximate_age: 3,
                                   sex: "female")
    @application_1 = Application.create!(name: "Sally",
                                         address: "234 Third Ave",
                                         city: "Dallas",
                                         state: "TX",
                                         zip: 88678,
                                         description: "I would be a great dog mom!")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet1.id, status: "Pending")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet2.id, status: "Pending")
  end

  it 'displays application w/ id and all attributes' do

    visit "/applications/#{@application_1.id}"

    expect(page).to have_content("#{@application_1.name}'s application")
    expect(page).to have_content("Name: #{@application_1.name}")
    expect(page).to have_content("Address: #{@application_1.address}")
    expect(page).to have_content("City: #{@application_1.city}")
    expect(page).to have_content("State: #{@application_1.state}")
    expect(page).to have_content("Zip: #{@application_1.zip}")
    expect(page).to have_content("Pets applied for:")
    @application_1.pets.each do |pet|
      expect(page).to have_content(pet.name)
    end

    expect(page).to have_content("I would be a great dog mom!")

    # expect(page).to have_content("Application status: Pending")
  end

  it 'has search for pet feature and brings me to their page' do
    visit "/applications/#{@application_1.id}"

    within('#add-a-pet') do
      expect(page).to have_content('Add a pet to this application')
      expect(page).to have_button('Search')
      expect(page).to_not have_content(@pet1.name)
      expect(page).to_not have_content(@pet2.name)

      fill_in "Search", with: "Thor"
      click_on "Search"

      expect(page).to have_content(@pet1.name)
      expect(page).to_not have_content(@pet2.name)
    end
  end

  it 'can search for pet and add it to application' do
    visit "/applications/#{@application_1.id}"

    within('#add-a-pet') do
      fill_in "Search", with: @pet1.name
      click_on "Search"

      expect(page).to have_content(@pet1.name)
      expect(page).to have_button("Adopt this pet")

      click_on "Adopt this pet"
    end

    expect(current_path).to eq("/applications/#{@application_1.id}")

    within("#pet-#{@pet1.id}") do
      expect(page).to have_content(@pet1.name)
    end
  end

  it 'can search through pets with partial name' do
    visit "/applications/#{@application_1.id}"

    within('#add-a-pet') do
      fill_in "Search", with: "Tho"
      click_on "Search"

      expect(page).to have_content(@pet1.name)
    end
  end
end
