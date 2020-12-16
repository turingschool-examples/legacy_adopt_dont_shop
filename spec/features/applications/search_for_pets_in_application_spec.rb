require 'rails_helper'

RSpec.describe 'As a user' do
  describe "when I visit the Application show page" do
    before :each do
      @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
      @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
      @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")

      @application = Application.create!(name: 'Billy Bob', 
        address: '123 W Street',
        city: 'Denver',
        state: 'CO',
        zip_code: '80246',
        description: "I love animals.",
        status: "Pending"
      )
    end

    describe "And an application has not been submitted" do
      it "has a section on the page to 'Add a Pet to this Application'" do
        visit applications_show_path(id: @application.id)

        expect(page).to have_content("Add a Pet to this Application")
        fill_in "Name:", with: "Thor"
        click_button "Search"
        expect(current_path).to eq("/applications/#{@application.id}")

        within("#application-#{@application.id}") do
          expect(page).to have_content(@pet1.name)
        end
      end
    end
    
    
  end
end