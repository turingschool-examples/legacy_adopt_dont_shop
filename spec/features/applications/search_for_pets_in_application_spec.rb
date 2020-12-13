require 'rails_helper'

RSpec.describe 'As a user' do
  describe "when I visit the Application show page" do
    let!(:shelter1) do
      Shelter.create(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    end
    let!(:shelter2) do
      Shelter.create(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    end
    let!(:shelter3) do
      Shelter.create(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    end
    let!(:pet1) do
     shelter1.pets.create(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    end
    let!(:pet2) do
      shelter2.pets.create(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    end
    let!(:pet3) do
      shelter1.pets.create(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    end
    let!(:application) do
      Application.create(name: 'Billy Bob', 
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
        visit applications_show_path(id: application.id)

        expect(page).to have_content("Search for pets:")
        fill_in "Search for pets:", with: "Thor"
        click_button "Submit"
        expect(current_path).to eq("/application/#{application.id}")
        # And under the search bar I see any Pet whose name matches my search
        expect(page).to have_content("Thor")
      end
    end
    
    
  end
end