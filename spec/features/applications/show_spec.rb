require 'rails_helper'

RSpec.describe 'the application show page' do
  it 'displays application attributes' do
    jenn = Application.create!(name:'Jenny O', address:'455 Zim Street', city:'Valporia', state:'Illinois', zip:'74515')

    visit "/applications/#{jenn.id}"

    expect(page).to have_content(jenn.name)
    expect(page).to have_content(jenn.address)
    expect(page).to have_content(jenn.city)
    expect(page).to have_content(jenn.state)
    expect(page).to have_content(jenn.zip)
  end
  describe 'within the pet-find section' do
    it 'has an add pet section with a form input' do
      shelter1 = Shelter.create!(name: "Just for Paws", address: "123 Amber St", city: "Littleton", state: "CO", zip: 80011)
      thor = shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      jenn = Application.create!(name:'Jenny O', address:'455 Zim Street', city:'Valporia', state:'Illinois', zip:'74515')
      visit "/applications/#{jenn.id}"

      within('.pet-find') do
        expect(page).to have_content('Add a Pet to this Application')

        fill_in 'pet_name', with: 'Thor'

        click_button 'Find Pets by Name'

        expect(current_path).to eq("/applications/#{jenn.id}")
        expect(page).to have_content('Thor')
        expect(page).to have_content('Age: 2')
      end
    end
    it 'displays an adopt pet button by each search result' do
      shelter1 = Shelter.create!(name: "Just for Paws", address: "123 Amber St", city: "Littleton", state: "CO", zip: 80011)
      thor = shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      jenn = Application.create!(name:'Jenny O', address:'455 Zim Street', city:'Valporia', state:'Illinois', zip:'74515')
      visit "/applications/#{jenn.id}"

      fill_in 'pet_name', with: 'Thor'

      click_button 'Find Pets by Name'

      expect(page).to have_content('Thor')
      expect(page).to have_content('Age: 2')
      expect(page).to have_button('Adopt this Pet')

      click_button 'Adopt this Pet'

      expect(current_path).to eq("/applications/#{jenn.id}")
      expect(page).to have_content('Applying for the following pets:')
      expect(page).to have_content('Thor')
    end
  end
end
