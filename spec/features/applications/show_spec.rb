require 'rails_helper'

RSpec.describe 'Application Show Page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @application1 = Application.create!(name: "Robert Heath", street: "521 E Thornhill Ave", city: "McAllen", state: "TX", zip: "78503", description: "I have always wanted a dog and would train him or her and would make sure they have lots of food.", status: "In Progress")
  end

  describe "on an application's show page" do
    it "shows the application information" do

      ApplicationPet.create!(pet: @pet1, application: @application1)
      ApplicationPet.create!(pet: @pet2, application: @application1)
      ApplicationPet.create!(pet: @pet3, application: @application1)

      visit "/applications/#{@application1.id}"

      expect(page).to have_content(@application1.name)
      expect(page).to have_content(@application1.street)
      expect(page).to have_content(@application1.city)
      expect(page).to have_content(@application1.state)
      expect(page).to have_content(@application1.zip)
      expect(page).to have_content(@application1.description)
      expect(page).to have_content(@application1.status)
      expect(page).to have_link("#{@application1.pets[0].name}")
      expect(page).to have_link("#{@application1.pets[1].name}")
      expect(page).to have_link("#{@application1.pets[2].name}")
      click_on "#{@application1.pets[0].name}"
      expect(current_path).to eq("/pets/#{@application1.pets[0].id}")
    end

    it "can add pets to an application" do

      visit "/applications/#{@application1.id}"

      expect(page).to have_content("Search for your new pet:")

      fill_in 'search', with: "Thor"
      click_on 'Submit'

      expect(current_path).to eq("/applications/#{@application1.id}")
      expect(page).to have_link("Thor")
      expect(page).to have_button("Adopt Me")

      click_on 'Adopt Me'
      expect(current_path).to eq("/applications/#{@application1.id}")

      within('#main') do
        expect(page).to have_link("Thor")
      end
    end

    describe "I have added one or more pets" do
      describe "I see a section to submit my application" do
        it "has a 'submit application' section" do

          visit "/applications/#{@application1.id}"

          fill_in 'search', with: "Thor"
          click_on 'Submit'
          click_on 'Adopt Me'

          expect(page).to have_button('Submit Application')
        end
    #
        it "submits the application and changes the status to pending" do

          visit "/applications/#{@application1.id}"

          fill_in 'search', with: "Thor"
          click_on 'Submit'
          click_on 'Adopt Me'
          click_on 'Submit Application'

          expect(page).to have_content('Pending')
          expect(page).not_to have_content('In Progress')
          expect(page).not_to have_button('Submit Application')
          expect(page).not_to have_content('Submit')
        end
      end
    end
    describe "On an application with no pets" do
      it "does not show the submit button" do
        visit "/applications/#{@application1.id}"

        expect(page).not_to have_button("Submit Application")
      end
    end

    describe "I can search for pets" do
      it "will return pets that are partial matches" do

        visit "/applications/#{@application1.id}"

        fill_in 'search', with: "Th"
        click_on 'Submit'

        expect(page).to have_link('Thor')
      end

      it "will return pets that are case insensitive" do
        visit "/applications/#{@application1.id}"

        fill_in 'search', with: "aThEnA"
        click_on 'Submit'

        expect(page).to have_link('Athena')
      end
    end
  end
end
