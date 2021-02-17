require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit an admin application show page ('/admin/applications/:id')" do
    before(:each) do
      @application_1 = build(:application)
      @application_1.save
      @application_2 = create(:application)
      @pet_1 = create(:pet, name: 'Fluffy')
      @pet_2 = create(:pet, name: 'Fluff')
      @pet_3 = create(:pet, name: 'MR. Fluff')
      @pet_4 = create(:pet, name: 'Flufftastic')
      @pet_5 = create(:pet)
      @application_1.pets << @pet_1
      @application_1.pets << @pet_2
      @application_1.pets << @pet_3
      @application_1.pets << @pet_4
      @application_1.pets << @pet_5
    end

    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      it "When I click that button" do
        visit "/admin/applications/#{@application_1.id}"
        save_and_open_page
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")

      end

      it "Then I'm taken back to the admin application show page" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets.first.id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        end

        within("#application_pet-#{@application_1.application_pets.last.id}") do
        expect(page).to have_content("#{@pet_5.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        expect(current_path).to eq("/admin/applications/#{@application_1.id}")
        end
      end

      it "And next to the pet that I approved, I do not see a button to approve this pet" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets.last.id}") do
          expect(page).to have_content("#{@pet_5.name.capitalize}")
          expect(page).to have_button("Approve")
          expect(page).to have_button("Reject")
          click_button("Approve")
          expect(current_path).to eq("/admin/applications/#{@application_1.id}")
          expect(page).to have_content("approved")
          expect(page).to have_no_button("Approve")
          expect(page).to have_no_button("Approve")
          expect(page).to have_content("approved")
          expect(current_path).to eq("/admin/applications/#{@application_1.id}")
        end

      end

      it "And instead I see an indicator next to the pet that they have been approved" do
        visit "/admin/applications/#{@application_1.id}"
        within("#application_pet-#{@application_1.application_pets.last.id}") do
          expect(page).to have_content("#{@pet_5.name.capitalize}")
          expect(page).to have_button("Approve")
          expect(page).to have_button("Reject")
          click_button("Approve")
          expect(current_path).to eq("/admin/applications/#{@application_1.id}")
          expect(page).to have_content("approved")
          expect(page).to have_no_button("Approve")
        end
      end
    end
  end
end
# As a visitor
# When I visit an admin application show page ('/admin/applications/:id')
# For every pet that the application is for, I see a button to approve the application for that specific pet
# When I click that button
# Then I'm taken back to the admin application show page
# And next to the pet that I approved, I do not see a button to approve this pet
# And instead I see an indicator next to the pet that they have been approved
