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

    describe "And I approve all pets on the application" do
      it "Then I see that those pets are no longer 'adoptable'" do
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
        expect(page).to have_content("#{@pet_3.name.capitalize}")
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

        visit "/pets/#{@pet_1.id}"
        expect(page).to have_content("Available for adoption: false")
        visit "/pets/#{@pet_2.id}"
        expect(page).to have_content("Available for adoption: false")
        visit "/pets/#{@pet_3.id}"
        expect(page).to have_content("Available for adoption: false")
        visit "/pets/#{@pet_4.id}"
        expect(page).to have_content("Available for adoption: false")
      end

      it "Then I see that those pets are no longer 'adoptable'" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets[0].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Reject')
        end
        within("#application_pet-#{@application_1.application_pets[1].id}") do
        expect(page).to have_content("#{@pet_2.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Reject')

        end
        within("#application_pet-#{@application_1.application_pets[2].id}") do
        expect(page).to have_content("#{@pet_3.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Reject')

        end

        within("#application_pet-#{@application_1.application_pets[3].id}") do
        expect(page).to have_content("#{@pet_4.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Reject')

      end
        visit "/pets/#{@pet_1.id}"
        expect(page).to have_content("Available for adoption: true")
        visit "/pets/#{@pet_2.id}"
        expect(page).to have_content("Available for adoption: true")
        visit "/pets/#{@pet_3.id}"
        expect(page).to have_content("Available for adoption: true")
        visit "/pets/#{@pet_4.id}"
        expect(page).to have_content("Available for adoption: true")
      end
    end
  end
end
