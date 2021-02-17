require 'rails_helper'

RSpec.describe 'the application show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Just for Paws", address: "123 Amber St", city: "Littleton", state: "CO", zip: 80011)
    @thor = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @jenn = Application.create!(name:'Jenny O', address:'455 Zim Street', city:'Valporia', state:'Illinois', zip:'74515')
  end
  it 'displays application attributes' do
    @jenn = Application.create!(name:'Jenny O', address:'455 Zim Street', city:'Valporia', state:'Illinois', zip:'74515')

    visit "/applications/#{@jenn.id}"

    expect(page).to have_content(@jenn.name)
    expect(page).to have_content(@jenn.address)
    expect(page).to have_content(@jenn.city)
    expect(page).to have_content(@jenn.state)
    expect(page).to have_content(@jenn.zip)
    expect(page).to have_content(@jenn.status)

  end
  describe 'within the pet-find section' do
    it 'has an add pet section with a form input' do
      visit "/applications/#{@jenn.id}"

      within('.pet-find') do
        expect(page).to have_content('Add a Pet to this Application')

        fill_in 'pet_name', with: 'Thor'

        click_button 'Find Pets by Name'

        expect(current_path).to eq("/applications/#{@jenn.id}")
        expect(page).to have_content('Thor')
        expect(page).to have_content('Age: 2')
      end
    end
    it 'displays an adopt pet button by each search result' do
      pet5 = @shelter1.pets.create!(image:"", name: "Tunar", description: "cat", approximate_age: 3, sex: "male")

      visit "/applications/#{@jenn.id}"

      fill_in 'pet_name', with: 'Tunar'

      click_button 'Find Pets by Name'

      expect(page).to have_content('Tunar')
      expect(page).to have_content('Age: 3')
      expect(page).to have_button('Adopt this Pet')

      click_button 'Adopt this Pet'

      expect(current_path).to eq("/applications/#{@jenn.id}")
      expect(page).to have_content('Applying for the following pets:')
      expect(page).to have_content('Tunar')
    end
  end
  describe 'the app submission section' do
    it 'does not display when no pets are associated' do
      visit "/applications/#{@jenn.id}"

      expect(page).to_not have_content('Submit Your Application')
    end
    it 'updates status and hides pet-find section' do
      pet5 = @shelter1.pets.create!(image:"", name: "Tunar", description: "cat", approximate_age: 3, sex: "male")
      @jenn.pets << pet5

      visit "/applications/#{@jenn.id}"

      within('.app-submit') do
        expect(page).to have_content('Submit Your Application')

        fill_in 'applicant_description', with: 'I just love animals'
        click_button 'Submit Application'
      end

      expect(current_path).to eq("/applications/#{@jenn.id}")
      expect(page).to have_content('Pending')
      expect(page).to_not have_content('Add a Pet to this Application')
      expect(page).to_not have_content('Submit Your Application')
    end
    it 'throws flash error if description is empty' do
      pet5 = @shelter1.pets.create!(image:"", name: "Tunar", description: "cat", approximate_age: 3, sex: "male")
      @jenn.pets << pet5

      visit "/applications/#{@jenn.id}"
      click_button 'Submit Application'

      expect(current_path).to eq("/applications/#{@jenn.id}")
      expect(page).to have_content("Submission requires a description")
    end
  end
end
