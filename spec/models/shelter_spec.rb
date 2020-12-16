require 'rails_helper'

describe Shelter, type: :model do
  describe 'relationships' do
    it {should have_many(:pets).dependent(:destroy)}
  end

  describe 'Class Methods' do
    before :each do
      @shelter1 = Shelter.create!(name: "A", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "B", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @shelter3 = Shelter.create!(name: "C", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    end

    it '.reverse_alphabetical' do
      expect(Shelter.reverse_alphabetical).to eq([@shelter3, @shelter2, @shelter1])
    end

    it '.name_address' do
      expect(Shelter.name_address(@shelter1.id)).to eq(@shelter1)
    end

  end
end
