require 'rails_helper'

RSpec.describe "the ADMIN applications show page" do
  before :each do
    @shelter = create(:shelter)
    @application = create(:application, status: "Pending")
    @pet_1 = create(:pet, shelter_id: @shelter.id, name: "Thor")
    @pet_2 = create(:pet, shelter_id: @shelter.id)
    @pet_3 = create(:pet, shelter_id: @shelter.id, name: "Thoraneous")
    @pet_4 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)


    @application.pets << @pet_2
    @application.pets << @pet_4

    @admin_app_show = "admin/applications/#{@application.id}"
  end

  describe "should show the application and attributes" do
    it "name, address, description, and status " do
      visit @admin_app_show

      expect(page).to have_content(@application.first_name)
      expect(page).to have_content(@application.last_name)
      expect(page).to have_content(@application.street_address)
      expect(page).to have_content(@application.city)
      expect(page).to have_content(@application.state)
      expect(page).to have_content(@application.zip)
      expect(page).to have_content(@application.description)
      expect(page).to have_content(@application.status)
    end

    it "should list and link to all pets associated with the application" do
      visit @admin_app_show

      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_4.name)

      click_on("#{@pet_2.name}")

      expect(current_path).to eq("/pets/#{@pet_2.id}")
    end
  end

  describe "should be able to approve an application" do
    it "should be able to approve a pet on the application" do
      visit @admin_app_show

      expect(page).to have_content("Approve for Adoption")
      first(:link).click_link("Approve for Adoption")

      expect(current_pathpage).to eq(@admin_app_show)
      expect(page).to have_content("APPROVED!")
    end

    it "should be able to reject a pet on the application" do
      visit @admin_app_show

      expect(page).to have_content("Approve for Adoption")
      first(:link).click_link("Reject")

      expect(current_path).to eq(@admin_app_show)
      expect(page).to have_content("Rejected!")
    end
  end
end
