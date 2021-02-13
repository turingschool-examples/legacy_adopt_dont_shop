require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @applicant1 = Applicant.create!(name: 'Angel', address: '123 Street', city: 'Conway', state: 'AR', zip: 72034, good_home_description: 'I love dogs.', status: 0)
    @shelter1 = Shelter.create!(name: 'Shady Shelter', address: '123 Shady Ave', city: 'Denver', state: 'CO', zip: 80011)
    @pet1 = @shelter1.pets.create!(image:'', name: 'Thor', description: 'dog', approximate_age: 2, sex: 'male')
    PetApplicant.create!(pet: @pet1, applicant: @applicant1)
  end

  describe 'When I visit an applications show page' do
    it 'I can see name, full address, description, pets, and status' do

      visit "/applicants/#{@applicant1.id}"

      within("#applicant-#{@applicant1.id}") do
        expect(page).to have_content(@applicant1.name)
        expect(page).to have_content(@applicant1.full_address)
        expect(page).to have_content(@applicant1.good_home_description)
        expect(page).to have_link("Thor")
        expect(page).to have_content(@applicant1.status)
      end
    end
  end
end
