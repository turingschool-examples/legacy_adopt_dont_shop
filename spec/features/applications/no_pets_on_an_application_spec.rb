require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a '/applications:id' show page'" do
    before(:each) do
      @application_1 = create(:application)
      @pet_1 = create(:pet)
      @pet_2 = create(:pet)
    end

    it "does not display 'submit application' if no pets are present" do

      visit "/applications/#{@application_1.id}"

      expect(page).not_to have_button("Submit Application")
      expect(@application_1.pets).to eq([])
      expect(@application_1.pets.length).to eq(0)
    end

    it "has added one or more pets to the application" do
      @application_1.pets << @pet_1
      @application_1.pets << @pet_2

      visit "/applications/#{@application_1.id}"

      expect(current_path).to eq("/applications/#{@application_1.id}")
      expect(page).to have_button("Submit Application")
      expect(page).to have_content("Why you would make a good pet owner")
      fill_in "description", :with => "I'd be an awesome dog parent because i love animals"
      click_button("Submit Application")
      expect(current_path).to eq("/applications/#{@application_1.id}")
      expect(page).to have_content("Pending")
      expect(page).to have_no_content("In Progress")
      save_and_open_page
      expect(page).to have_content("#{@pet_1.name.capitalize}")
      expect(page).to have_content("#{@pet_2.name.capitalize}")
      expect(page).to have_no_content("add pets")
    end
  end
end
