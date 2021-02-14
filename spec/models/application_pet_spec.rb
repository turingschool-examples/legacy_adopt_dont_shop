require 'rails_helper'

describe ApplicationPet, type: :model do
  before :each do
    ApplicationPet.destroy_all
    Pet.destroy_all
    Shelter.destroy_all
    Application.destroy_all
    shelter = create(:shelter, id: 1)
    @pet1 = create(:pet, id: 1, shelter_id: 1)
    @pet2 = create(:pet, id: 2, shelter_id: 1, name: "onyx")
    @application = create(:application, id: 1)
    @application_pet = create(:application_pet, application_id: 1, pet_id: 1)
  end
  describe 'relationships' do
    it { should belong_to :application }
    it { should belong_to :pet }
  end

  describe 'validations' do
    it {should validate_presence_of :application_id}
    it {should validate_presence_of :pet_id}
  end

  it 'status can be nil by default' do
    expect(@application_pet.status).to eq(nil)
    expect(@application_pet.approved?).to eq(false)
    expect(@application_pet.rejected?).to eq(false)
  end
  it 'status can be approved' do
    application_pet = create(:application_pet, application_id: 1, pet_id: 1, status: :approved)
    expect(application_pet.status).to eq("approved")
    expect(application_pet.approved?).to eq(true)
    expect(application_pet.rejected?).to eq(false)
  end
  it 'status can be rejected' do
    application_pet = create(:application_pet, application_id: 1, pet_id: 1, status: :rejected)
    expect(application_pet.status).to eq('rejected')
    expect(application_pet.approved?).to eq(false)
    expect(application_pet.rejected?).to eq(true)
  end
end
