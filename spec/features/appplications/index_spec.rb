require 'rails_helper'

RSpec.describe 'Applications index page' do
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

  it "can show appplicant information" do
    visit "/applications"
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

    within("#application-#{@jordan.id}") do
      expect(page). to have_content(@jordan.name)
      expect(page). to have_content(@jordan.street)
      expect(page). to have_content(@jordan.city)
      expect(page). to have_content(@jordan.state)
      expect(page). to have_content(@jordan.zip_code)
      expect(page). to have_content(@jordan.description)
      expect(page). to have_content(@jordan.application_status)
      expect(page). to have_link(@pet1.name)
    end
  end
end
