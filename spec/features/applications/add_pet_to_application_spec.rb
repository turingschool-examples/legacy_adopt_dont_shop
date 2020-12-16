require 'rails_helper'

RSpec.describe 'as a user' do
  describe "when I view an in progress application" do
    before :each do
      @shelter1 = FactoryBot.create(:shelter)
      @pet1 = FactoryBot.create(:pet)
      @pet2 = FactoryBot.create(:pet)
      @application = FactoryBot.create(:application)
    end

    it "pets can be added to application" do
      visit "/applications/#{@application.id}"

      fill_in "Name:", with: "#{@pet1.name}"
      click_button "Search"

      
      within("#pet-#{@pet1.id}") do
        expect(page).to have_content(@pet1.name)
        click_link("Adopt this Pet")
      end
      
      expect(current_path).to eq("/applications/#{@application.id}")
      save_and_open_page
      within("#pets-applied") do
        expect(page).to have_content(@pet1.name)
      end
    end
  end
end