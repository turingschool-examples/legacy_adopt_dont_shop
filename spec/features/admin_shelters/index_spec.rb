require "rails_helper"
describe "admin shelter index page" do
  before :each do
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Funny Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter3 = Shelter.create!(name: "Singular Shelter", address: "1 Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)

    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    visit "/admin/shelters"
  end

  it "lists all shelters in reverse alphabetical order by name" do


    name1 = find(".shelter-#{@shelter1.id}")
    name2 = find(".shelter-#{@shelter2.id}")
    name3 = find(".shelter-#{@shelter3.id}")

    expect(name3).to appear_before(name2)
    expect(name2).to appear_before(name1)

    expect(page).to have_content("Shady Shelter")
    expect(page).to have_content("Silly Shelter")
    expect(page).to have_content("Singular Shelter")
  end

  it "shows shelters with pending application section containing shelters that have pending applications" do
    shel2 = find("shelter-#{@shelter2.id}")
    expect(shel2).to appear_before("All Shelters")
  end
end
