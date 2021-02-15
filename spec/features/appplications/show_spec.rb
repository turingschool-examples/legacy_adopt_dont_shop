require 'rails_helper'

RSpec.describe 'Applications show page' do
  before :each do
    @dominic = Application.create!(name: "Dominic", street: "2298 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 cats", application_status: "Pending" )
    @jordan = Application.create!(name: "Jordan", street: "2300 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 dogs", application_status: "Approved" )
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    ApplicationPet.create!(application: @dominic, pet: @pet1)
    ApplicationPet.create!(application: @dominic, pet: @pet2)
    ApplicationPet.create!(application: @dominic, pet: @pet3)
    ApplicationPet.create!(application: @jordan, pet: @pet1)
  end
    #story test 2
  it "can show appplicant information" do
    visit "/applications/#{@dominic.id}"
    within("#application-#{@dominic.id}") do
      expect(page). to have_content(@dominic.name)
      expect(page). to have_content(@dominic.street)
      expect(page). to have_content(@dominic.city)
      expect(page). to have_content(@dominic.state)
      expect(page). to have_content(@dominic.zip_code)
      expect(page). to have_content(@dominic.description)
      expect(page). to have_content(@dominic.application_status)
      expect(page). to have_link(@pet1.name)
    end
  end

  #Story test 4
  it "can add a pet on your application show page" do
    david = Application.create!({name: 'David', street: "101 new street", city: 'Aurora', state: 'CO', zip_code: 80017,
                                          description: 'I love kittens', application_status: 'In Progress'})
    pet4 = @shelter2.pets.create!(image:"", name: "Linel", description: "cat", approximate_age: 3, sex: "female")
    visit "/applications/#{david.id}"
    expect(page).to have_content("Add a pet to your Application")
    expect(page).to have_content("Search for your Pet by Name")

    fill_in "Search for your Pet by Name", with: "#{pet4.name}"
    click_on "Search"

    expect(current_path).to eq("/applications/#{david.id}")
    expect(page).to have_content("#{pet4.name}")
  end

end
