require 'rails_helper'

describe Shelter, type: :model do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "ZZZ", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
  end

  describe 'relationships' do
    it { should have_many :pets }
  end

  describe 'class methods' do
    it 'sorts shelters in reverse alphbetical order' do 

      expect(Shelter.sort_alpha).to eq([@shelter3, @shelter2, @shelter1])
    end
  end
end
