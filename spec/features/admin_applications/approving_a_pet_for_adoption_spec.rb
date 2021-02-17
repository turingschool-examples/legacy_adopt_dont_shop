require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit an admin application show page ('/admin/applications/:id')" do
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

    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      it "When I click that button" do
        visit "/admin/applications/#{@application_1.id}"

        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")

      end

      it "Then I'm taken back to the admin application show page" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@ppplication.application_pets.first}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_content("Reject")
        end

        within("#application_pet-#{@ppplication.application_pets.last}") do
        expect(page).to have_content("#{@pet_4.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_content("Reject")
        click_button("Approve")
        expect(current_path).to eq("/admin/applications/#{@application_1.id}")
        end

      end

      it "And next to the pet that I approved, I do not see a button to approve this pet" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@ppplication.application_pets.last}") do
          expect(page).to have_content("#{@pet_4.name.capitalize}")
          expect(page).to have_button("Approve")
          expect(page).to have_content("Reject")
          click_button("Approve")
          expect(current_path).to eq("/admin/applications/#{@application_1.id}")
          expect(page).to have_content("Approved")
          expect(page).to have_no_button("Approve")
        end
        save_and_open_page
        click_button("Approve")

        expect(page).to have_no_button("Approve")
        expect(page).to have_content("Approved")
        # expect(page).to have_content("")
        expect(current_path).to eq("/admin/applications/#{@application_1.id}")
        expect(page).not_to have_button("Approve")
      end

      it "And instead I see an indicator next to the pet that they have been approved" do
        expect(page).to have_button("Approve")
        expect(page).to have_content("")
        click_button("Approve")
        expect(current_path).to eq("/admin/applications/#{@application_1.id}")
        expect(page).not_to have_button("Approve")
        expect(page).to have_content("#{pet_1.name} approved")
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
