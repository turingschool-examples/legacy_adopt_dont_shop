require 'rails_helper'

RSpec.describe PetApplicant do
  describe 'relationships' do
    it { should belong_to :pet }
    it { should belong_to :applicant }
  end

  describe 'class methods' do
    it 'returns a pet applicant record with matching pet and applicant ids' do
      applicant1 = Applicant.create!(name: 'Angel', address: '123 Street', city: 'Conway', state: 'AR', zip: 72034)
      shelter1 = Shelter.create!(name: 'Shady Shelter', address: '123 Shady Ave', city: 'Denver', state: 'CO', zip: 80011)
      pet1 = shelter1.pets.create!(image:'', name: 'Thor', description: 'dog', approximate_age: 2, sex: 'male')
      pet_applicant = PetApplicant.create!(pet: pet1, applicant: applicant1)

      expect(PetApplicant.find_by(pet1.id, applicant1.id)).to eq(pet_applicant)
    end

    it 'returns boolean if the pet on the application is approved' do
      applicant1 = Applicant.create!(name: 'Angel', address: '123 Street', city: 'Conway', state: 'AR', zip: 72034)
      shelter1 = Shelter.create!(name: 'Shady Shelter', address: '123 Shady Ave', city: 'Denver', state: 'CO', zip: 80011)
      pet1 = shelter1.pets.create!(image:'', name: 'Thor', description: 'dog', approximate_age: 2, sex: 'male')
      pet_applicant = PetApplicant.create!(pet: pet1, applicant: applicant1, is_pet_approved: true)

      expect(PetApplicant.pet_applicant_approved?(pet1.id, applicant1.id)).to eq(true)
    end
  end
end
