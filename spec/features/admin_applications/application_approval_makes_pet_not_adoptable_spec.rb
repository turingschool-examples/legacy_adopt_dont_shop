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
      it "And when I visit the show pages for those pets" do
        visit "/admin/applications/#{@application_1.id}"
      end

      it "Then I see that those pets are no longer 'adoptable'" do
        visit "/admin/applications/#{@application_1.id}"

        within("#application_pet-#{@application_1.application_pets[0].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Approve')
        end
        within("#application_pet-#{@application_1.application_pets[1].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
        click_button('Approve')

        end
        within("#application_pet-#{@application_1.application_pets[2].id}") do
        expect(page).to have_content("#{@pet_1.name.capitalize}")
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
        expect(page).to have_content("")
        visit "/pets/#{@pet_2.id}"
        visit "/pets/#{@pet_3.id}"
        visit "/pets/#{@pet_4.id}"

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

Application Approval makes Pets not adoptable

As a visitor
When I visit an admin application show page
And I approve all pets on the application
And when I visit the show pages for those pets
Then I see that those pets are no longer "adoptable"
