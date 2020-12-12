require 'rails_helper'

RSpec.describe ApplicationPet do
  describe 'relationships' do
    it { should belong_to :application}
    it { should belong_to :pet}
  end

  describe 'instance methods' do
    it 'does not have a status on creation' do
      application_pet = create(:application_pet)

      expect(application_pet.status).to be_nil
    end

    it 'can be approved' do
      application_pet = create(:application_pet)

      application_pet.approve

      expect(application_pet.status).to eq("Approved")
    end

    it 'can be rejected' do
      application_pet = create(:application_pet)

      application_pet.approve

      expect(application_pet.status).to eq("Approved")
    end
  end
end
