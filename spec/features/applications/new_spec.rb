require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a new application page and click submit with a blank field' do
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
      it 'Takes me back to the new application page and shows me an error message' do

      visit '/applications/new'

      click_on "Submit Application"

      expect(page).to have_content("A field cannot be empty")
      expect(page).to have_button('Submit Application')
    end
  end
end
