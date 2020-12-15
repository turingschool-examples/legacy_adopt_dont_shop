require 'rails_helper'

describe "Applications show page" do
  it "can see the attributes and information associated with an application" do
    @application1 = Application.create!(
      name: "Bob Ross", address: "123 Paint Spill Lane", city: "Denver",
      state: "Colorado", zip: 80224, description: "I love animals")

    visit "/applications/#{@application1.id}"

    expect(page).to have_content("Applicant Name: #{@application1.name}")
    expect(page).to have_content("Street Address: #{@application1.address}")
    expect(page).to have_content("City: #{@application1.city}")
    expect(page).to have_content("State: #{@application1.state}")
    expect(page).to have_content("Zip Code: #{@application1.zip}")
    expect(page).to have_content("Why the applicant says they'd be a good home: #{@application1.description}")
    expect(page).to have_content("Pets Applied For:")
    expect(page).to have_content("Application Status: #{@application1.status}")
  end
  describe "before application is submitted" do
    it "can see a section to Add a Pet with a field to search pets" do
      @application1 = Application.create!(
        name: "Bob Ross", address: "123 Paint Spill Lane", city: "Denver",
        state: "Colorado", zip: 80224, description: "I love animals")

      visit "/applications/#{@application1.id}"

      expect(page).to have_content("Add a Pet to this Application:")
      expect(page).to have_field(:search)
      expect(page).to have_button("Search")
    end
  end
  describe "when I fill in the search field and click submit" do
    it "brings me back to the application show page and I can see any Pet who matches search" do
        application1 = Application.create!(
          name: "Bob Ross", address: "123 Paint Spill Lane", city: "Denver",
          state: "Colorado", zip: 80224, description: "I love animals")
        shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
        shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
        pet1 = shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
        pet2 = shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")

        visit "/applications/#{application1.id}"

        fill_in :search, with: pet1.name
        click_on "Search"

        expect(current_path).to eq("/applications/#{application1.id}")
        expect(page).to have_content(pet1.name)
    end
  end
end
