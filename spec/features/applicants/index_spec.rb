require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @applicant1 = Applicant.create!(name: 'Angel', address: '123 Street', city: 'Conway', state: 'AR', zip: 72034, good_home_description: 'I love dogs.', status: 0)
    @shelter1 = Shelter.create!(name: 'Shady Shelter', address: '123 Shady Ave', city: 'Denver', state: 'CO', zip: 80011)
    @pet1 = @shelter1.pets.create!(image:'', name: 'Thor', description: 'dog', approximate_age: 2, sex: 'male')
    PetApplicant.create!(pet: @pet1, applicant: @applicant1)
  end
end
