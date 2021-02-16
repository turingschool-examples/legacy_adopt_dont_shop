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
                                         status: "In Progress")
    @application_2 = Application.create!(name: "Joe",
                                         address: "234 Third Ave",
                                         city: "Dallas",
                                         state: "TX",
                                         zip: 88678,
                                         status: "In Progress")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet1.id)
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet2.id)
  end

  it 'displays application w/ id and all attributes' do

    visit "/applications/#{@application_1.id}"

    expect(page).to have_content("#{@application_1.name}'s application")
    expect(page).to have_content("Name: #{@application_1.name}")
    expect(page).to have_content("Address: #{@application_1.address}")
    expect(page).to have_content("City: #{@application_1.city}")
    expect(page).to have_content("State: #{@application_1.state}")
    expect(page).to have_content("Zip: #{@application_1.zip}")
    expect(page).to have_content("Application status: #{@application_1.status}")
    expect(page).to have_content("Pets applied for:")
    @application_1.pets.each do |pet|
      expect(page).to have_content(pet.name)
    end

    expect(page).to have_selector('#add-a-pet')
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
      fill_in "Search", with: "Thor"
      click_on "Search"

      expect(page).to have_content(@pet1.name)
      expect(page).to have_button("Adopt this pet")

      click_on "Adopt this pet"
    end

    expect(current_path).to eq("/applications/#{@application_1.id}")

    within("#pet-section") do
      expect(page).to have_content(@pet1.name)
    end
  end

  it 'fill in description section and submit application' do
    visit "/applications/#{@application_1.id}"

    expect(@application_1.pets.length).to eq(2)

    within('#add-description') do
      expect(page).to have_button("Submit Application")
      fill_in "description", with: "I would be a great dog mom!"
      click_on("Submit Application")
    end

    expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(page).to have_content("Pending")

    within("#pet-section") do
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet2.name)
    end

    expect(page).to have_selector('#add-a-pet', visible: false)
  end

  it 'do not see submit app if no pets added' do
    visit "/applications/#{@application_2.id}"

    within('#add-description') do
      expect(page).to_not have_button('Submit Application')
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

  it 'can search through pets with case insensitive' do
    visit "/applications/#{@application_1.id}"

    within('#add-a-pet') do
      fill_in "Search", with: "THO"
      click_on "Search"

      expect(page).to have_content(@pet1.name)
    end
  end

end
