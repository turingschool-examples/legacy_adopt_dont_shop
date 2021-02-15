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

    webpage = "/applications/new"
  end

  describe "as a visitor" do
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
      end

      it "should not be able to create an application with missing info" do

        visit webpage

        click_on "Submit"

        expect(page).to have_content("Application not created: Require information missing.")
        expect(page).to have_content("New Application Form")

      end
    end
  end
end
