require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit an application show page" do
    before :each do
      @shelter = FactoryBot.create(:shelter)
      @pet1 = FactoryBot.create(:pet)
      @pet2 = FactoryBot.create(:pet, name: "#{@pet1.name} Jr.")
      @application = FactoryBot.create(:application)
    end

    
    it "and I search for Pets by name" do
      visit "applications/#{@application.id}"
      fill_in "Name:", with: "#{@pet1.name}"
      click_button "Search"
      
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet2.name)
    end
  end

end
# And I search for Pets by name
# Then I see any pet whose name PARTIALLY matches my search