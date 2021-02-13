require "rails_helper"

RSpec.describe "Application new page" do
  describe "when I visit the pet index page" do
    it "Has a link to create a new application" do
      visit "/pets"

      expect(page).to have_link("Start an Application")

      click_link("Start an Application")

      expect(current_path).to eq("/applicattions/new")
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
  end
end
