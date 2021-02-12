require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a '/applications/' index page'" do
    it "Then I see a link to 'Start an Application'" do
      before(:each) do
        @applicatioin=Factory(:application)
        @pet=Factory(:pet)
      end

      application = Application.new(params)

      visit "/applications/#{application.id}"

      expect(current_path).to eq("/applications/#{application.id}")
      expect(page).to have_content("Name: #{application.name}")
      expect(page).to have_content("Address: #{application.address}")
      expect(page).to have_content("Description: #{application.description}")
      expect(page).to have_content("Name of all pets: #{application.pets}")
      expect(page).to have_content("Application status:#{application.pets}")
    end

    it "When I click this link" do

    end

    it  "Then I am taken to the new application page where I see a form" do

    end

    it "When I fill in this form with my:" do
      #   - Name
      #   - Street Address
      #   - City
      #   - State
      #   - Zip Code

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
