require 'rails_helper'

RSpec.describe "Applications creation" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @application1 = Application.create!(name: "Robert Heath", street: "521 E Thornhill Ave", city: "McAllen", state: "TX", zip: "78503", description: "I have always wanted a dog and would train him or her and would make sure they have lots of food.", status: "In progress")

    ApplicationPet.create!(pet: @pet1, application: @application1)
    ApplicationPet.create!(pet: @pet2, application: @application1)
    ApplicationPet.create!(pet: @pet3, application: @application1)
  end

  describe "As a visitor" do
    describe "I can create a new application" do
      it "takes me to the new application page" do

        visit "/pets"
        click_link "Start an Application"

        expect(current_path).to eq("/applications/new")
      end
    end
    it "can fill out a form" do
      visit "/pets"
      click_link "Start an Application"

      fill_in 'name', with: 'Michael Heath'
      fill_in 'street', with: '674 Locust Hill Rd.'
      fill_in 'city', with: 'Chester'
      fill_in 'state', with: 'WV'
      fill_in 'zip', with: '26034'
      fill_in 'description', with: 'I love puppies so much'
      click_on 'Submit'
      save_and_open_page

      expect(current_path).to eq("/applications/#{Application.last.id}")
      expect(page).to have_content("Michael Heath")
      expect(page).to have_content("674 Locust Hill Rd.")
      expect(page).to have_content("Chester")
      expect(page).to have_content("26034")
      expect(page).to have_content("I love puppies so much")
      expect(page).to have_content("In Progress")
    end
  end
end
