require 'rails_helper'

RSpec.describe Application, type: :model do
  # describe 'validations' do
    # it { should validate_presence_of :}
  # end

  describe 'relationships' do
    it {should have_many :pet_applications}
  end

  # describe 'instance methods' do
  # end
end
