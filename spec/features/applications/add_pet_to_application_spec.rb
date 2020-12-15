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

      # And I search for a Pet by name
      fill_in "Name: ", with: "#{@pet1.name}"
      click_button "Search"

      # And I see the names Pets that match my search
      within("#pet-#{@pet1.id}") do
        expect(page).to have_content(@pet1.name)
        # Then next to each Pet's name I see a button to "Adopt this Pet"
        # When I click one of these buttons
        expect(page).to find_button("Adopt this Pet").click
      end
      
      # Then I am taken back to the application show page
      expect(current_path).to eq("/applications/#{@pet1.id}")
      
      within("#pets-applied") do
        # And I see the Pet I want to adopt listed on this application
        expect(page).to have_content(@pet1.name)
      end
    end


  end
end