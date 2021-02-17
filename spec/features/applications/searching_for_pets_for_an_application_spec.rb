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
      @pet_1 = create(:pet)
      @pet_2 = create(:pet)
      @pet_3 = create(:pet)
      @pet_4 = create(:pet)
      @pet_5 = create(:pet)
      @pet_6 = create(:pet)
      @pet_7 = create(:pet)
      @pet_8 = create(:pet)

    end

    describe "And that application has not been submitted," do
      it "" do
        #i need if that application has not been submitted lofic in my show page or show action
        # require "pry"; binding.pry
        visit "/applications/#{@application_1.id}"

        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
      end

      it "When I fill in this field with a Pet's name" do
        visit "/applications/#{@application_1.id}"

        fill_in "pet_search", :with => "pet"
        click_button("Submit")
        save_and_open_page
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_1.name}")
        expect(page).to have_content("#{@pet_2.name}")
        #expect specific section of the page to have content
        # Then I am taken back to the application show page
        # And under the search bar I see any Pet whose name matches my search
      end
    end
  end
end
