require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a '/pets' index page'" do
    before(:each) do
      @application = create(:application)
      @pet = create(:pet)
    end
    it "Then I see a link to 'Start an Application'" do


      visit "/pets"
      expect(current_path).to eq("/pets")
      expect(page).to have_link("Start an Application")

      # expect(page).to have_content("Name: #{application.name}")
      # expect(page).to have_content("Address: #{application.address}")
      # expect(page).to have_content("Description: #{application.description}")
      # expect(page).to have_content("Name of all pets: #{application.pets}")
      # expect(page).to have_content("Application status:#{application.pets}")
    end

    it "When I click this link" do
      visit "/pets"
      expect(current_path).to eq("/pets")
      expect(page).to have_link("Start an Application")
      click_link("Start an Application")
      expect(current_path).to eq("/applications/new")
    end

    it "When I fill in this form with my:" do
      #   - Name
      #   - Street Address
      #   - City
      #   - State
      #   - Zip Code
      visit "/pets"
      expect(current_path).to eq("/pets")
      expect(page).to have_link("Start an Application")
      click_link("Start an Application")
      expect(current_path).to eq("/applications/new")
      save_and_open_page


      fill_in "name", :with => "Shrewsbury Heights"
      fill_in "address", :with => "123 fake st."
      fill_in "description", :with => "I'd be a good dog dad because i love dogs!!"
      click_button("Submit")

    end

    it "And I click submit" do

    end

    it "Then I am taken to the new application's show page" do

    end

    it "And I see my Name, address information, and description of why I would make a good home" do

    end

    it 'And I see an indicator that this application is "In Progress"' do

    end
  end
end



# Starting an Application
#
# As a visitor
# When I visit the pet index page
# Then I see a link to "Start an Application"
# When I click this link
# Then I am taken to the new application page where I see a form
# When I fill in this form with my:
#   - Name
#   - Street Address
#   - City
#   - State
#   - Zip Code
# And I click submit
# Then I am taken to the new application's show page
# And I see my Name, address information, and description of why I would make a good home
# And I see an indicator that this application is "In Progress"
