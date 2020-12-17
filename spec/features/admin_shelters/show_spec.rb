require "rails_helper"
describe "admin shelter index page" do
  before :each do
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Funny Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter3 = Shelter.create!(name: "Singular Shelter", address: "1 Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)


    visit "/admin/shelters/#{@shelter1.id}"
  end

  it "shows shelter name and full address" do
    expect(page).to have_content("Shady Shelter")
    expect(page).to have_content("123 Shady Ave Denver, CO 80011")
  end
end
