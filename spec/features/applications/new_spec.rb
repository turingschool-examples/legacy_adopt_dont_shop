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
      expect(page).to have_button("submit")
    end

    it "will redirect me to the new applications show page" do
      visit "/applications/new"

      fill_in "name", with: "John"
      fill_in "street", with: "123 Abc St."
      fill_in "city", with: "San Diego"
      fill_in "state", with: "CA"
      fill_in "zip", with: "92078"
      click_button "submit"

      # expect(current_path).to eq("")  ###### NEED TO FIGURE OUT WAY TO TEST PATH #######
    end

    it "will render errors when all fields are not filled out" do
      visit "/applications/new"
      click_button "submit"

      within(".errors") do
        expect(page).to have_content("name can't be blank")
        expect(page).to have_content("street can't be blank")
        expect(page).to have_content("city can't be blank")
        expect(page).to have_content("state can't be blank")
        expect(page).to have_content("zip can't be blank")
      end
    end
  end
end
