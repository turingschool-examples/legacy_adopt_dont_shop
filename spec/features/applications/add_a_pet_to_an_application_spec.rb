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
      @pet_1 = create(:pet)
      @pet_2 = create(:pet)
      @pet_3 = create(:pet)
      @pet_4 = create(:pet)
      @pet_5 = create(:pet)
      @pet_6 = create(:pet)
      @pet_7 = create(:pet)
      @pet_8 = create(:pet)

    end

    describe "And i search a pet by name" do
      it "see the names Pets that match my search" do

        visit "/applications/#{@application_1.id}"

        fill_in "pet_search", :with => "pet"
        click_button("Submit")
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
      end

      it 'Then next to each Pets name I see a button to "Adopt this Pet"' do

        visit "/applications/#{@application_1.id}"

        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
        fill_in "pet_search", :with => "pet"
        click_button("Submit")
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        # expect(page).to have_button("Adopt this Pet")

      end

      it 'clicks one of these buttons and takes me back to applications show page' do
        visit "/applications/#{@application_1.id}"

        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
        fill_in "pet_search", :with => "pet"
        click_button("Submit")
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        within("#pet-#{@pet_1.id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Adopt this Pet")
        end
        within("#pet-#{@pet_2.id}") do
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_button("Adopt this Pet")
        end
        save_and_open_page
        within("#pet-#{@pet_1.id}") do
          click_button ("Adopt this Pet")
        end
      end

      it "redirects me to the application page, and the adopted pet is added to the applicant list" do
        visit "/applications/#{@application_1.id}"

        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Search pets by name")
        fill_in "pet_search", :with => "pet"
        click_button("Submit")
        expect(current_path).to eq("/applications/#{@application_1.id}")
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        within("#pet-#{@pet_1.id}") do
          expect(page).to have_content("#{@pet_1.name.capitalize}")
          expect(page).to have_button("Adopt this Pet")
        end
        within("#pet-#{@pet_2.id}") do
          expect(page).to have_content("#{@pet_2.name.capitalize}")
          expect(page).to have_button("Adopt this Pet")
        end
        within("#pet-#{@pet_1.id}") do
          expect(page).to have_button("Adopt this Pet")
          click_button ("Adopt this Pet")
        end
        save_and_open_page
        expect(current_path).to eq("/applications/#{@application_1.id}")
        within("#adopted-pet-#{@pet_1.id}") do
          expect(page).to have_content("#{@pet_1.name}")
        end
      end
    end
  end
end

# As a
# When I visit  application's show page
# And I search for a Pet by name
# And I see the names Pets that match my search
# When I click one of these buttons
# Then I am taken back to the application show page
# And I see the Pet I want to adopt listed on this application
