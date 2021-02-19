require 'rails_helper'

RSpec.describe 'the Application show page' do
  before :each do
    @application1 = Application.create!(
      name: 'Diana Espinoza',
      address: '1712 Circus Ave.',
      city: 'Cloudy',
      state: 'BA',
      zip: 68705,
      description: "I've had pets all my life, and I have really been wanting a cat! I am aware of the responsabilities that come along with a fur baby, and the bond that will form will make them all worth it!"
    )
    @shelter = Shelter.create!(
      name: "Magical Creatures",
      address: "123 Thunder Path Ave",
      city: "Joo",
      state: "WT",
      zip: 84812
    )
    @hedwig = @shelter.pets.create!(
      name: "Hedwig",
      approximate_age: 3,
      sex: 'male',
      description: 'super smart'
    )
    @eddy = @shelter.pets.create!(
      name: "Eddy",
      approximate_age: 10,
      sex: 'female',
      description: 'very loyal'
    )
    @scabbers = @shelter.pets.create!(
      name: "Scabbers",
      approximate_age: 10,
      sex: 'male',
      description: 'fun'
    )
  end

  it 'should display the name of the applicant, full address, description, names of pets, application status' do

    visit "/applications/#{@application1.id}"

    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.address)
    expect(page).to have_content(@application1.city)
    expect(page).to have_content(@application1.state)
    expect(page).to have_content(@application1.zip)
    expect(page).to have_content(@application1.description)
    expect(page).to have_content(@application1.status)
  end

  describe 'displays a section to add pets to the application when not submitted' do
    it 'can search for Pets by name' do

      visit "/applications/#{@application1.id}"

      expect(page).to have_content("Add a Pet to this Application")
      expect(page).to have_button("search")
    end

    it 'can find pets that match by name' do
      visit "/applications/#{@application1.id}"

      fill_in 'search_pets', with: 'Scabbers'
      click_on 'search'

      expect(page).to have_content(@scabbers.name)
    end

    it 'can find pets that match the name partially or case insensitive' do
      visit "/applications/#{@application1.id}"

      fill_in 'search_pets', with: 'ed'
      click_on 'search'

      expect(page).to have_content(@hedwig.name)
      expect(page).to have_content(@eddy.name)
    end
  end

  describe 'adding pets from search to application' do
    it 'can add pets to application when clicking adopt this pet' do
      visit "/applications/#{@application1.id}"

      fill_in 'search_pets', with: 'hedwig'
      click_on 'search'

      expect(page).to have_link('adopt this pet!')
      click_on('adopt this pet!')
      expect(page).to have_content('PETS ADDED TO YOUR APPLICATION:')
      expect(page).to have_link('Hedwig')
    end
  end
end
