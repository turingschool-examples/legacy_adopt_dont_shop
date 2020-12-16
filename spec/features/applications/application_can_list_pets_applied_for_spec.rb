require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I have multiple pets in my application" do
    before :each do
      @shelter = FactoryBot.create(:shelter)
      @pet1 = FactoryBot.create(:pet)
      @pet2 = FactoryBot.create(:pet)
      @application = FactoryBot.create(:application)
  
      PetApplication.create(application: @application, pet: @pet1)
      PetApplication.create(application: @application, pet: @pet2)
    end
  
    it "lists pet names and pictures on show page" do
      visit "/applications/#{@application.id}"

      within("#pets-applied") do
        expect(page).to have_content(@pet1.name)
        expect(page).to have_content(@pet2.name)
      end
    end
  end
end