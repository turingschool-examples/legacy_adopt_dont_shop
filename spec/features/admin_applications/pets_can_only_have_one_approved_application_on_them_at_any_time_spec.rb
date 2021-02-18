require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "And I visit the admin application show page for the pending application" do
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
      @application_2.pets << @pet_1
      @application_2.pets << @pet_2
      @application_2.pets << @pet_3
      @application_2.pets << @pet_4
    end

    describe "When a pet has an 'Approved' application on them" do
      it "And when the pet has a 'Pending' application on them" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets[0].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Approve')
        end

        within("#application_pet-#{@application_1.application_pets[1].id}") do
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Approve')
        end

        within("#application_pet-#{@application_1.application_pets[2].id}") do
        expect(page).to have_content("#{@pet_3.name}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Approve')
        end

        within("#application_pet-#{@application_1.application_pets[3].id}") do
        expect(page).to have_content("#{@pet_4.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Approve')
        end

        visit "/admin/applications/#{@application_2.id}"

        within("#application_pet-#{@application_2.application_pets[0].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_no_button("Approve")
        expect(page).to have_button("Reject")
        expect(page).to have_content("still adoptable: false")
        end
        save_and_open_page

        within("#application_pet-#{@application_2.application_pets[1].id}") do
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_no_button("Approve")
        expect(page).to have_button("Reject")
        expect(page).to have_content("still adoptable: false")
        end

        within("#application_pet-#{@application_2.application_pets[2].id}") do
        expect(page).to have_content("#{@pet_3.name}")
        expect(page).to have_no_button("Approve")
        expect(page).to have_button("Reject")
        expect(page).to have_content("still adoptable: false")
        end

        within("#application_pet-#{@application_2.application_pets[3].id}") do
        expect(page).to have_content("#{@pet_4.name}")
        expect(page).to have_no_button("Approve")
        expect(page).to have_button("Reject")
        expect(page).to have_content("still adoptable: false")
        end

      end
    end
  end
end
