require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit an admin application show page" do
    before :each do
      @shelter = FactoryBot.create(:shelter)
      @pet1 = FactoryBot.create(:pet)
      @application = FactoryBot.create(:application)
  
      PetApplication.create(application: @application, pet: @pet1)
    end
    
    it "has an approve button for each pet on an application" do
      visit "/admin/applications/#{@application.id}"

      expect(page).to have_content("Admin Account")
      expect(page).to have_content("Application=#{@application.id}")

      within("pet-#{@pet1.id}") do
        expect(page).to have_content(@pet1.name)
      end
    end
    
    it "can approve a pet on an application" do
      visit "/admin/applications/#{@application.id}"

      within("pet-#{@pet1.id}") do
        click_button("Approve")
      end

      expect(current_path).to eq("/admin/applications/#{@application.id}")

      within("pet-#{@pet1.id}") do
        expect(page).to have_content(@pet1.name)
        expect(page).to have_content("Approved")
      end
    end
  end
# When I visit an admin application show page ('/admin/applications/:id')
# For every pet that the application is for, I see a button to approve the application for that specific pet
# When I click that button
# Then I'm taken back to the admin application show page
# And next to the pet that I approved, I do not see a button to approve this pet
# And instead I see an indicator next to the pet that they have been approved
end