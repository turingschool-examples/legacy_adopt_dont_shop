require 'rails_helper'

RSpec.describe 'Application new page' do
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
                                         description: "I would be a great dog mom!",
                                         status: "Pending")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet1.id)
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet2.id)
  end

  it "can create new application from pets index" do
    visit '/pets'

    expect(page).to have_link('Start an Application')

    click_link('Start an Application')

    expect(current_path).to eq('/applications/new')

    fill_in "name", with: "Sally"
    fill_in "address", with: "234 Third Ave"
    fill_in "city", with: "Dallas"
    fill_in "state", with: "TX"
    fill_in "zip", with: 88678
    fill_in "description", with: "I would be a great dog mom!"

    click_on('Submit')

    # expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(page).to have_content("Sally")
    expect(page).to have_content("234 Third Ave")
    expect(page).to have_content("Dallas")
    expect(page).to have_content("TX")
    expect(page).to have_content(88678)
  end

  it 'gives error for incomplete application' do
    visit '/applications/new'

    fill_in "name", with: "Sally"
    fill_in "address", with: "234 Third Ave"
    fill_in "city", with: ""
    fill_in "state", with: "TX"
    fill_in "zip", with: 88678
    fill_in "description", with: "I would be a great dog mom!"

    click_on('Submit')

    expect(current_path).to eq('/applications/new')
    expect(page).to have_content('Your application was not saved. Please fill in all application fields.')
  end
end
