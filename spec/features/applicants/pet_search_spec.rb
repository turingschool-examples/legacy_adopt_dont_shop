require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @applicant1 = Applicant.create!(name: 'Angel', address: '123 Street', city: 'Conway', state: 'AR', zip: 72034, good_home_description: 'I love dogs.', status: 0)
    @shelter1 = Shelter.create!(name: 'Shady Shelter', address: '123 Shady Ave', city: 'Denver', state: 'CO', zip: 80011)
    @pet1 = @shelter1.pets.create!(image:'', name: 'Thor', description: 'dog', approximate_age: 2, sex: 'male')
    PetApplicant.create!(pet: @pet1, applicant: @applicant1)
  end

  describe "When I visit an application's show page" do
    it 'I see a section on the page to "Add a Pet to this Application"' do

      visit "/applicants/#{@applicant1.id}"
      expect(page).to have_content('Add a Pet to this Application')
    end

    it 'I see an input where I can search for Pets by name' do
      visit "/applicants/#{@applicant1.id}"
      within(".applicant-pet-search") do
        fill_in :search, with: 'Thor'
        click_button('Search')
        expect(current_path).to eq("/applicants/#{@applicant1.id}")
        expect(page).to have_content(@pet1.name)
      end
    end
  end
end
