require 'rails_helper'

RSpec.describe 'Pets index page' do
  before :each do
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
  describe 'As a visitor' do
  before :each do
    @shelter_1 = create(:shelter)
    @shelter_2 = create(:shelter)
    @shelter_3 = create(:shelter)
    @pet_1 = create(:pet, shelter: @shelter_1)
    @pet_2 = create(:pet, shelter: @shelter_2)
    @pet_3 = create(:pet, shelter: @shelter_3)
    @application_1 = create(:application)
    @application_2 = create(:application)
    @application_3 = create(:application)
  end
  it 'I see a link to start an application' do

    visit '/pets'
    expect(page).to have_link("Start Application")

    click_on("Start Application")
    visit "/applications/new"

    fill_in(:applicant_name, with: "#{@application_1.applicant_name}")
    fill_in(:applicant_address, with: "#{@application_1.applicant_address}")
    fill_in(:city, with: "#{@application_1.city}")
    fill_in(:state, with: "#{@application_1.state}")
    fill_in(:zip, with: "#{@application_1.zip}")

    click_on("Submit Application")

    visit "/applications/#{@application_1.id}"

    expect(page).to have_content("#{@application_1.applicant_name}")
    expect(page).to have_content("#{@application_1.applicant_address}")
    expect(page).to have_content("#{@application_1.city}")
    expect(page).to have_content("#{@application_1.state}")
    expect(page).to have_content("#{@application_1.zip}")
    expect(page).to have_content("#{@application_1.status}")
    end
  end
end
