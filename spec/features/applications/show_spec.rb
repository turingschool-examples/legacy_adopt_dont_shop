require 'rails_helper'

RSpec.describe "the applications show page" do
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

    @app_show_url = "/applications/#{@application.id}"
  end

  describe "should show the application and attributes" do
    it "name, address, description, and status " do
      visit @app_show_url

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
      visit @app_show_url

      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_4.name)

      click_on("#{@pet_2.name}")

      expect(current_path).to eq("/pets/#{@pet_2.id}")
    end
  end

  describe "should be able to add pets to Pending applications" do
    it "should be able to search and add pets" do

      visit @app_show_url

      expect(page).to have_content("Pending")
      expect(page).to have_content("Add a Pet to this Application")

      fill_in(:query, with: "Thor")
      click_button("Search")

      expect(current_path).to eq (@app_show_url)
      expect(page).to have_content("Thor")
      expect(page).to have_content("Thoraneous")
      expect(page).to_not have_content(@pet_5.name)
    end
  end
end
