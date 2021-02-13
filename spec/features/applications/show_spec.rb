require 'rails_helper'

RSpec.describe 'Application show page' do
  before :each do
    ApplicationPet.destroy_all
    Pet.destroy_all
    Shelter.destroy_all
    Application.destroy_all
    shelter = create(:shelter, id: 1)
    @pet1 = create(:pet, id: 1, shelter_id: 1)
    @pet2 = create(:pet, id: 2, shelter_id: 1, name: "onyx")
    @application = create(:application, id: 1)
    @application_pets = create(:application_pet, application_id: 1, pet_id: 1)
    @application_pets2 = create(:application_pet, application_id: 1, pet_id: 2)
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
        expect(page).to have_content("Pets' Names:")
        within("div") do
          expect(page).to have_content(@pet1.name)
          expect(page).to have_content(@pet2.name)
        end
        expect(page).to have_content("Application Status: #{@application.capitalized_status}")
      end

      describe "And that application has not been submitted," do
        describe "Then I see a section on the page to 'Add a Pet to this Application'" do
          describe "When I fill in this field with a Pet's name and I click submit," do
            ApplicationPet.destroy_all
            it "under the search bar I see any Pet whose name matches my search" do
              visit "/applications/#{@application.id}"
              within("section") do
                expect(page).to have_content("Add a Pet to this Application")
                expect(page).to have_content("Pet name")
                expect(page).to have_button("Search")
                fill_in('pet_name', with: 'Daisy')
                click_on('Search')

                expect(page).to have_content("Daisy")
              end
            end
            it "when I click Adopt this Pet it adds the pet to the application" do
              visit "/applications/#{@application.id}"
              within("section") do
                fill_in('pet_name', with: 'Daisy')
                click_on('Search')

                expect(page).to have_content("Daisy")
                expect(page).to have_button("Adopt this Pet")
                click_on("Adopt this Pet")
              end
              within("div") do
                expect(page).to have_content(@pet1.name)
              end

            end
          end
        end
      end
      describe "And that application has been submitted," do
        it "does not show the search for pets" do
          application = create(:application, id: 2, status: :pending)
          visit "/applications/#{application.id}"
            expect(page).to_not have_content("Add a Pet to this Application")
            expect(page).to_not have_content("Pet name")
            expect(page).to_not have_button("Search")
        end
      end
    end
  end
end
