require 'rails_helper'

RSpec.describe "the applications show page" do
  before :each do
    @shelter = create(:shelter)
    @application = create(:application)
    @pet_1 = create(:pet, shelter_id: @shelter.id)
    @pet_2 = create(:pet, shelter_id: @shelter.id)
    @pet_3 = create(:pet, shelter_id: @shelter.id)
    @pet_4 = create(:pet, shelter_id: @shelter.id)
    @pet_5 = create(:pet, shelter_id: @shelter.id)

    @application.pets << @pet_1
    @application.pets << @pet_2
    @application.pets << @pet_3
    @application.pets << @pet_4
    @application.pets << @pet_5
  end

  describe "should show the application and attributes" do
    it "name, address, description, and status " do
      visit "/applications/#{@application.id}"

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
      visit "/applications/#{@application.id}"

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_3.name)
      expect(page).to have_content(@pet_4.name)
      expect(page).to have_content(@pet_5.name)

    end
  end
end
