require 'rails_helper'

RSpec.describe 'Admin Application show page' do
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
    describe "When I visit an admin application show page ('/admin/applications/:id')" do
      describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
        describe "When I click that button then I'm taken back to the admin application show page" do
          it "next to the pet that I approved, I do not see a button to approve this pet,instead I see an indicator next to the pet that they have been approved" do
            visit "/admin/applications/#{@application.id}"
            within "#pet-#{@pet1.id}" do
              expect(page).to have_content(@pet1.name)
              expect(page).to have_button("Approve Pet")
              click_button "Approve Pet"

              expect(page).to_not have_button("Approve Pet")
              expect(page).to have_content("Approved!")
            end
            within "#pet-#{@pet2.id}" do
              expect(page).to have_content(@pet2.name)
              expect(page).to have_button("Approve Pet")
            end
          end
        end
      end
    end
  end
end
