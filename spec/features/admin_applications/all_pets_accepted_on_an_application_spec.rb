require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit an admin application show page ('/admin/applications/:id')" do
    before(:each) do
      @application_1 = build(:application)
      @application_1.save
      @pet_1 = create(:pet, name: 'Keno')
      @pet_2 = create(:pet, name: 'Fido')
      @pet_3 = create(:pet, name: 'MR. Fluff')
      @pet_4 = create(:pet, name: 'Flufftastic')
      @application_1.pets << @pet_1
      @application_1.pets << @pet_2
      @application_1.pets << @pet_3
      @application_1.pets << @pet_4
    end

    describe "And I approve all pets for an application" do
      it "And I see the application's status has changed to 'Approved'" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets[0].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        within("#application_pet-#{@application_1.application_pets[1].id}") do
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        within("#application_pet-#{@application_1.application_pets[2].id}") do
        expect(page).to have_content("#{@pet_3.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        within("#application_pet-#{@application_1.application_pets[3].id}") do
        expect(page).to have_content("#{@pet_4.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        expect(current_path).to eq("/admin/applications/#{@application_1.id}")

        expect(page).to have_content("status: approved")
        expect(page).to have_no_button("Approve")
        expect(page).to have_no_button("Reject")
      end

      it "And I see the application's status has changed to 'Approved'" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets[0].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        within("#application_pet-#{@application_1.application_pets[1].id}") do
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        within("#application_pet-#{@application_1.application_pets[2].id}") do
        expect(page).to have_content("#{@pet_3.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Approve")
        end
        within("#application_pet-#{@application_1.application_pets[3].id}") do
        expect(page).to have_content("#{@pet_4.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button("Reject")
        end
        expect(current_path).to eq("/admin/applications/#{@application_1.id}")

        save_and_open_page
        expect(page).to have_content("status: rejected")
        expect(page).to have_no_button("Approve")
        expect(page).to have_no_button("Reject")
      end
    end
  end
end
