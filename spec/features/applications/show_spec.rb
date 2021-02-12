require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    ApplicationsPets.destroy_all
    Application.destroy_all
    @application = Application.create!(first_name: 'Jenny', last_name: 'Branham',
                                      address: '123 Adoption Ln.', city: 'Denver',
                                      state: 'CO', zipcode: '80222',
                                      description: 'description of application', status: 'in_progress')
  end
  describe 'As a visitor' do
    describe 'When I visit an applications show page' do
      it "I see name of applicant, full address, description, names of pets, and status" do
        visit "/applications/#{@application.id}"

        expect(page).to have_content("Application for #{@application.first_name} #{@application.last_name}")
        expect(page).to have_content("Address: #{@application.address}")
        expect(page).to have_content("City: #{@application.city}")
        expect(page).to have_content("State: #{@application.state}")
        expect(page).to have_content("Zipcode: #{@application.zipcode}")
        expect(page).to have_content("Description: #{@application.description}")
        #expect(page).to have_content("Pets' Names: #{@application.sex}")
        expect(page).to have_content("Application Status: #{@application.status}")
      end
    end
  end
end
