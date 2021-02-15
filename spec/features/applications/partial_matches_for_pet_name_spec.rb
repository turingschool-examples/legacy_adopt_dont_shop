require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'applications/:id" do
    before(:each) do
      #create_list(:pets, 3, :application)
      # @application = Application.new(name:'jim', address: "1234", description: 'good dog dad', status: "pending")

      @application_1 = build(:application)
      @application_1.save

      @application_2 = create(:application)
      @application_1.pets << create(:pet)
      @application_1.pets << create(:pet)
      @application_2.pets << create(:pet)
      @pet_1 = create(:pet, name: 'fluffy')
      @pet_2 = create(:pet, name: 'fluff')
      @pet_3 = create(:pet, name: 'mr. fluff')
      @pet_4 = create(:pet, name: 'flufftastic')
      @pet_5 = create(:pet)
      @pet_6 = create(:pet)
      @pet_7 = create(:pet)
      @pet_8 = create(:pet)

    end

    describe "And I search for Pets by name" do
      it "Then I see any pet whose name PARTIALLY matches my search" do
        visit "/applications/#{@application_1.id}"

        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
      end

      it "For example, if I search for 'fluff, my search would match pets with names 'fluffy', 'fluff', and 'mr. fluff" do
        visit "/applications/#{@application_1.id}"

        fill_in "pet_search", :with => "fluff"
        click_button("Submit")
        save_and_open_page
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_content("#{@pet_3.name.capitalize}")
        expect(page).to have_content("#{@pet_4.name.capitalize}")
      end
    end
  end
end
