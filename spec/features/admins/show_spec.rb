require 'rails_helper'

RSpec.describe 'the admin app show page' do
  before :each do
    shelter = Shelter.create!(name: "Tom Pawyer's", address: "884 Enderon Circle", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = shelter.pets.create!(image:"", name: "Lunar", description: "cat", approximate_age: 3, sex: "female")
    @pet2 = shelter.pets.create!(image:"", name: "Tunar", description: "cat", approximate_age: 3, sex: "male")
    @chaz = Application.create!(name:'Chaz X', address:'3904 Chapel Drive', city:'Sarasota', state:'Florida', zip:'34243', description:'recently married couple looking for a furry friend, no dog or cat preference')
    @chaz.pets << @pet1
    @chaz.pets << @pet2
  end
  describe 'approval section' do
    it 'displays each associated pet with approval buttons' do
      visit "/admin/applications/#{@chaz.id}"

      within('#approval') do
        expect(page).to have_content('Approve Pets')
        within("#pet-#{@pet1.id}") do
          expect(page).to have_content('Lunar')
          expect(page).to have_button("Approve Lunar")
        end
        within("#pet-#{@pet2.id}") do
          expect(page).to have_content('Tunar')
          expect(page).to have_button("Approve Tunar")
        end
      end
    end
    it 'updates button to approved on approval' do
      visit "/admin/applications/#{@chaz.id}"
      within('#approval') do
        expect(page).to have_content('Approve Pets')
        within("#pet-#{@pet1.id}") do
          expect(page).to have_content('Lunar')
          expect(page).to have_button("Approve Lunar")
          click_button 'Approve Lunar'
          expect(current_path).to eq("/admin/applications/#{@chaz.id}")
          expect(page).to_not have_button("Approve Lunar")
          expect(page).to have_content('Approved')
        end
        within("#pet-#{@pet2.id}") do
          expect(page).to have_content('Tunar')
          expect(page).to have_button("Approve Tunar")
        end
      end
    end
  end
end
