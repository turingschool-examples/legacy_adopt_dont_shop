require "rails_helper"
describe "admin shelter index page" do
  before :each do
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Funny Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter3 = Shelter.create!(name: "Singular Shelter", address: "1 Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)


    visit "/admin/shelters"
  end

  it "lists all shelters in reverse alphabetical order by name" do
    name1 = find("shelter-#{@shelter1.id}")
    name2 = find("shelter-#{@shelter1.id}")
    name3 = find("shelter-#{@shelter1.id}")

    expect(name1).to appear_before(name2)
    expect(name2).to appear_before(name3)

    expect(page).to have_content("Shady Shelter")
    expect(page).to have_content("Silly Shelter")
    expect(page).to have_content("Singular Shelter")
  end
end
