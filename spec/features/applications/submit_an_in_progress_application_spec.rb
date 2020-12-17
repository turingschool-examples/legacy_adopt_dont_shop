require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit a show page for an application with pets" do
    # And I have added one or more pets to the application
    before :each do
      @shelter1 = FactoryBot.create(:shelter)
      @pet1 = FactoryBot.create(:pet)
      @pet2 = FactoryBot.create(:pet)
      @application = FactoryBot.create(:application)
      PetApplication.create(application: @application, pet: @pet1)
      PetApplication.create(application: @application, pet: @pet2)
    end

    # Then I see a section to submit my application
    it "should have a section for submitting the application" do
      visit "/applications/#{@application.id}"

      expect(page).to have_content("Add a Pet to this Application")
      
      # And in that section I see an input to enter why I would make a good owner for these pet(s)
      within("#description-section") do
        # When I fill in that input
        expect(page).to have_content("Why would you be a good home?")
        fill_in("description", :with => "I have a large house and am home most of the time.")
        # And I click a button to submit this application
        click_button "Submit Application"

      end
      
      # Then I am taken back to the application's show page
      expect(current_path).to eq("/applications/#{@application.id}")
      expect(page).to have_content(@application.description)

      # And I see an indicator that the application is "Pending"
      expect(page).to have_content("Application Status: Pending")

      # And I see all the pets that I want to adopt
      expect(page).to have_link(@pet1.name, href: "/pets/#{@pet1.id}")
      expect(page).to have_link(@pet2.name, href: "/pets/#{@pet2.id}")

      # And I do not see a section to add more pets to this application
      expect(page).not_to have_content("Add a Pet to this Application")
    end
  end
end