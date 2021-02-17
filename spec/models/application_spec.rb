require 'rails_helper'

describe Application, type: :model do

  describe 'relationships' do
    it { should have_many :application_pets }
    it {should have_many(:pets).through(:application_pets)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :description}
  end
end
