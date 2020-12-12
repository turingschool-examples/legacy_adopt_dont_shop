require 'rails_helper'

RSpec.describe PetApplications, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :}
  end

  describe 'relationships' do
    it {should belong_to :pets}
    it {should belong_to :applications}
  end

  describe 'instance methods' do
  end
end