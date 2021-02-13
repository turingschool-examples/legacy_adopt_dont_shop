require 'rails_helper'

RSpec.describe Applicant do
  before :each do
    @applicant = Applicant.create!(name: 'Angel', address: '123 Street', city: 'Conway', state: 'AR', zip: 72034)
  end

  describe 'relationships' do
    it { should have_many :pet_applicants }
    it { should have_many(:pets).through(:pet_applicants) }
  end

  describe 'instance methods' do
    it 'returns the full address' do
      full_address = "#{@applicant.address} #{@applicant.city}, #{@applicant.state} #{@applicant.zip}"

      expect(@applicant.full_address).to eq(full_address)
    end
  end
end
