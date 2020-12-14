require "rails_helper"

describe "application pet show page" do

  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)

    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter1.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus 2", description: "dog", approximate_age: 4, sex: "male")

    @application1 = Application.create(applicant: "John Doe", description: "I love dogs!!!", address: "Somewhere")
    @application2 = Application.create(applicant: "Jane Doe", description: "I love dogs more than John", address: "Somewhere")

    ApplicationPet.create(application: @application1, pet: @pet1)
    ApplicationPet.create(application: @application1, pet: @pet2)

    ApplicationPet.create(application: @application2, pet: @pet2)
    ApplicationPet.create(application: @application2, pet: @pet3)
  end


  it "has a search form that causes the app to list pets matching the search" do
    visit "/applications/#{@application1.id}/pets"
    expect(page).to have_button("Search by Name")
    fill_in "search", with: "Zeus"
    click_on "Search"
    expect(page).to have_content(@pet3.name)

    expect(page).to have_no_content(@pet1.name)
    expect(page).to have_no_content(@pet4.name)
  end
end
