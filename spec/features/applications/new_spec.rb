require 'rails_helper'

RSpec.describe "application new page" do
  before :each do
    @shelter = create(:shelter)
    @application = create(:application)
    @pet_1 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
  end

  describe  "should have a form to begin a new application" do
    it "should be able to fill out and submit the form" do

      visit "/applications/new"

      fill_in "first_name", with: "Mark"
      fill_in "last_name", with: "Germ"
      fill_in "street_address", with: "456 Blacksmyths Way"
      fill_in "city", with: "Huckleyberry"
      fill_in "state", with: "IL"
      fill_in "zip", with: "78910"

      click_on "Submit"

      expect(page).to have_content("Mark")
      expect(page).to have_content("Germ")
      expect(page).to have_content("456 Blacksmyths Way")
      expect(page).to have_content("Huckleyberry")
      expect(page).to have_content("IL")
      expect(page).to have_content("78910")
      expect(page).to have_content("Pending")
      expect(page).to have_content("Why I would make a good owner:")
      expect(current_path).to eq("applications/4")
    end
  end
end
