require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'applications/:id" do
    before(:each) do
      #create_list(:pets, 3, :application)
      # @application = Application.new(name:'jim', address: "1234", description: 'good dog dad', status: "pending")

      @application_1 = create(:application)
      @application_2 = create(:application)
      @application_1.pets << create(:pet)
      @application_1.pets << create(:pet)
      @application_2.pets << create(:pet)
      @application_2.pets << create(:pet)

    end
    it "Then I can see the following:name, full address, name of all pets, application status" do

      visit "/applications/#{@application_1.id}"
      save_and_open_page

      expect(current_path).to eq("/applications/#{@application_1.id}")

      expect(page).to have_content("Name: #{@application_1.name}")
      expect(page).to have_content("Address: #{@application_1.address}")
      expect(page).to have_content(@application_1.pets.first.name)
      expect(page).to have_content(@application_1.pets.last.name)
      expect(page).to have_content("Application status: #{@application_1.status}")

    end
    it "visits another applications page" do
      visit "/applications/#{@application_2.id}"
      save_and_open_page

      expect(current_path).to eq("/applications/#{@application_2.id}")
      expect(page).to have_content("Name: #{@application_2.name}")
      expect(page).to have_content("Address: #{@application_2.address}")
      expect(page).to have_content(@application_2.pets.first.name)
      expect(page).to have_content(@application_2.pets.last.name)
      expect(page).to have_content("Application status: #{@application_2.status}")
    end
  end
end



# As a visitor
# When I visit an applications show page
# Then I can see the following:
# - Name of the Applicant
# - Full Address of the Applicant including street address, city, state, and zip code
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pets that this application is for (all names of pets should be links to their show page)
# - The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
