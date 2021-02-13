require "rails_helper"

RSpec.describe "Application new page" do
  describe "when I visit the pet index page" do
    it "Has a link to create a new application" do
      visit "/pets"

      expect(page).to have_link("Start an Application")

      click_link("Start an Application")

      expect(current_path).to eq("/applications/new")
    end
  end

  describe "when I visit the application new page" do
    it "will have a form to start an application" do
      visit "/applications/new"

      expect(page).to have_field("name")
      expect(page).to have_field("street")
      expect(page).to have_field("city")
      expect(page).to have_field("state")
      expect(page).to have_field("zip")
      expect(page).to have_field("description")
      expect(page).to have_button("submit")
    end

#     it "will redirect me to the new applications show page" do
#       visit "/applications/new"
#
#       fill_field "name", with: "John"
#       fill_field "street", with: "123 Abc St."
#       fill_field "city", with: "San Diego"
#       fill_field "state", with: "CA"
#       fill_field "zip", with: "92078"
#       click_button "submit"
# require "pry"; binding.pry
#       expect(current_path).to eq("")
#     end
  end
end
