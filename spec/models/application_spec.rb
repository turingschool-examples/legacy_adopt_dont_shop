require 'rails_helper'

describe Application, type: :model do
  describe 'relationships' do
    it { should have_many :pet_applications}
    it { should have_many(:pets).through(:pet_applications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_length_of(:name).is_at_least(3)}
    it { should validate_length_of(:name).is_at_most(50)}
    it { should validate_presence_of(:address)}
    it { should validate_length_of(:address).is_at_least(3)}
    it { should validate_length_of(:address).is_at_most(50)}
    it { should validate_presence_of(:city)}
    it { should validate_length_of(:city).is_at_least(3)}
    it { should validate_length_of(:city).is_at_most(50)}
    it { should validate_presence_of(:state)}
    it { should validate_length_of(:state).is_at_least(2)}
    it { should validate_length_of(:state).is_at_most(2)}
    it { should validate_presence_of(:zip)}
    it { should validate_numericality_of(:zip)}
  end
end
