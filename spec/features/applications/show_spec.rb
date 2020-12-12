require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit an application show page' do
    before :each do
      @shelter_1 = create(:shelter)
      @shelter_2 = create(:shelter)
      @shelter_3 = create(:shelter)
      @pet_1 = create(:pet, shelter: @shelter_1)
      @pet_2 = create(:pet, shelter: @shelter_2)
      @pet_3 = create(:pet, shelter: @shelter_3)
      @application_1 = create(:application)
      @application_2 = create(:application)
      @application_3 = create(:application)
    end
      it 'I can see the application and its attributes ' do
        visit "/applications/#{@application_1.id}"

        expect(page).to have_content(@application_1.applicant_name)
        expect(page).to have_content(@application_1.applicant_address)
        expect(page).to have_content(@application_1.city)
        expect(page).to have_content(@application_1.state)
        expect(page).to have_content(@application_1.zip)
        expect(page).to have_content(@application_1.description)
        expect(page).to have_content("In Progress")
      end
      xit 'Has a section to add pet in case application not submitted' do

        @application_1.status = nil
        visit "/applications/#{@application_1.id}"
        save_and_open_page
        expect(@application_1.status).to eq(nil)
        expect(page).to have_content("Add a pet to this application")
      end

  end
end
