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

    describe "When there are two applications in the system for the same pet" do
      it "When I visit the admin application show page for one of the applications" do
        visit "/admin/applications/#{@application_1.id}"
      end

      it "And I approve or reject the pet for that application" do
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

      it "When I visit the other application's admin show page" do
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

      it "Then I do not see that the pet has been accepted or rejected for that application" do
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

      it "And instead I see buttons to approve or reject the pet for this specific application" do

      end
    end
  end
end
