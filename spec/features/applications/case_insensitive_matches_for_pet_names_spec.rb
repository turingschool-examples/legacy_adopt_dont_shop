require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'applications/:id" do
    before(:each) do
      @application_1 = build(:application)
      @application_1.save
      @application_2 = create(:application)
      @application_1.pets << create(:pet)
      @application_1.pets << create(:pet)
      @application_2.pets << create(:pet)
      @pet_1 = create(:pet, name: 'Fluffy')
      @pet_2 = create(:pet, name: 'Fluff')
      @pet_3 = create(:pet, name: 'MR. Fluff')
      @pet_4 = create(:pet, name: 'Flufftastic')
      @pet_5 = create(:pet)
      @pet_6 = create(:pet)
      @pet_7 = create(:pet)
      @pet_8 = create(:pet)

    end

    describe "And I search for Pets by name" do
      it "Then my search is case insensitive" do
        visit "/applications/#{@application_1.id}"

        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
      end

      it "For example, if I search for 'fluff', my search would match pets with names 'Fluffy', 'FLUFF,' and 'Mr. FlUfF'" do
        visit "/applications/#{@application_1.id}"

        fill_in "pet_search", :with => "fluff"
        click_button("Submit")
        save_and_open_page
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_1.name}")
        expect(page).to have_content("#{@pet_2.name}")
        expect(page).to have_content("#{@pet_3.name.capitalize}")
        expect(page).to have_content("#{@pet_4.name}")
      end
    end
  end
end
