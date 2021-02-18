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
      @application_1.pets << @pet_1
      @application_1.pets << @pet_2
      @application_1.pets << @pet_3
      @application_1.pets << @pet_4
    end

    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      it "When I click that button" do
        visit "/admin/applications/#{@application_1.id}"
      end

      it "For every pet that the application is for, I see a button to reject the application for that specific pet" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets.first.id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        end

        within("#application_pet-#{@application_1.application_pets.last.id}") do
        expect(page).to have_content("#{@pet_4.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        end
      end

      it "And next to the pet that I approved, I do not see a button to approve this pet" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets.first.id}") do
          expect(page).to have_content("#{@pet_1.name.capitalize}")
          expect(page).to have_button("Approve")
          expect(page).to have_button("Reject")
          click_button("Reject")
          expect(current_path).to eq("/admin/applications/#{@application_1.id}")
          expect(page).to have_content("rejected")
          expect(page).to have_no_button("Reject")
          expect(page).to have_no_button("Approve")
        end
        save_and_open_page
      end

      it "And instead I see an indicator next to the pet that they have been rejected" do
        visit "/admin/applications/#{@application_1.id}"
        within("#application_pet-#{@application_1.application_pets.last.id}") do
          expect(page).to have_content("#{@pet_4.name.capitalize}")
          expect(page).to have_button("Approve")
          expect(page).to have_button("Reject")
          click_button("Reject")
          expect(current_path).to eq("/admin/applications/#{@application_1.id}")
          expect(page).to have_content("rejected")
          expect(page).to have_no_button("Approve")
          expect(page).to have_no_button("Reject")
        end
      end
    end
  end
end

# When I visit an admin application show page ('/admin/applications/:id')
# For every pet that the application is for, I see a button to reject the application for that specific pet
# When I click that button
# Then I'm taken back to the admin application show page
# And next to the pet that I rejected, I do not see a button to approve or reject this pet
# And instead I see an indicator next to the pet that they have been rejected
