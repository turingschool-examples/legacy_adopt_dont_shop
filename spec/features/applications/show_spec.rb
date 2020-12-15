require 'rails_helper'

RSpec.describe 'Pets index page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @application1 = Application.create!(name: "Robert Heath", street: "521 E Thornhill Ave", city: "McAllen", state: "TX", zip: "78503", description: "I have always wanted a dog and would train him or her and would make sure they have lots of food.")

    ApplicationPet.create!(pet: @pet1, application: @application1)
    ApplicationPet.create!(pet: @pet2, application: @application1)
    ApplicationPet.create!(pet: @pet3, application: @application1)
  end

  describe "on an application's show page" do
    it "shows the application information" do

      visit "/applications/#{@application1.id}"

      expect(page).to have_content(@application1.name)
      expect(page).to have_content(@application1.street)
      expect(page).to have_content(@application1.city)
      expect(page).to have_content(@application1.state)
      expect(page).to have_content(@application1.zip)
      expect(page).to have_content(@application1.description)
      expect(page).to have_content(@application1.status)
      expect(page).to have_content(@application1.pets[0].name)
      expect(page).to have_content(@application1.pets[1].name)
      expect(page).to have_content(@application1.pets[2].name)
      end
      #still need to test that the pets link to their pages
  end
end
