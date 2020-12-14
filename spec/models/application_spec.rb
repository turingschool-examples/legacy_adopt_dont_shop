require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it { should have_many :application_pets}
    it { should have_many(:pets).through(:application_pets)}
  end

  # describe 'validations' do
  #   it { should validate_prescence_of :application_name }
  #   it { should validate_prescence_of :street_address }
  #   it { should validate_prescence_of :city }
  #   it { should validate_prescence_of :state }
  #   it { should validate_prescence_of :zip_code }
  # end
end
