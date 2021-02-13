require 'rails_helper'

RSpec.describe "the applications show page" do
  before :each do
    @shelter = create(:shelter)
    @application = create(:application)
    @pet_1 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)
  end

  describe "should show the application and attributes" do
    it "name, address, description, and status " do
      visit "/shelters/#{@shelter.id}/applications/#{@application.id}"

      expect(page).to have_content(@application.first_name)
      expect(page).to have_content(@application.last_name)
      expect(page).to have_content(@application.street_address)
      expect(page).to have_content(@application.city)
      expect(page).to have_content(@application.state)
      expect(page).to have_content(@application.zip)
      expect(page).to have_content(@application.description)
      expect(page).to have_content(@application.status)
    end
  end
end
