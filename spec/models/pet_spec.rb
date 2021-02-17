require 'rails_helper'

describe Pet, type: :model do
  describe 'relationships' do
    it { should belong_to :shelter }
    it { should have_many :pet_applications }
    it { should have_many(:applications).through(:pet_applications)}
  end

  describe 'validations' do
    before :each do
      @shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      @pet = @shelter.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
    end

    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :sex}
    it {should validate_numericality_of(:approximate_age).is_greater_than_or_equal_to(0)}

    it 'is created as adoptable by default' do
      expect(@pet.adoptable).to eq(true)
    end

    it 'can be created as not adoptable' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(adoptable: false, name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      expect(pet.adoptable).to eq(false)
    end

    it 'can be male' do
      expect(@pet.sex).to eq('male')
      expect(@pet.male?).to be(true)
      expect(@pet.female?).to be(false)
    end

    it 'can be female' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(sex: :female, name: "Fluffy", approximate_age: 3, description: 'super cute')
      expect(pet.sex).to eq('female')
      expect(pet.female?).to be(true)
      expect(pet.male?).to be(false)
    end
  end
  describe 'class methods' do
    describe 'Pet::match' do
      it 'returns matching pet objects' do
        shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
        pet = shelter.pets.create!(sex: :female, name: "Jimmy", approximate_age: 4, description: 'super cute')

        expect(Pet.match('Jimmy')).to eq([pet])
      end
      it 'returns partial matches' do
        shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
        pet = shelter.pets.create!(sex: :female, name: "Jimmy", approximate_age: 4, description: 'super cute')

        expect(Pet.match('Jim')).to eq([pet])
      end
      it 'returns case-insensitive matches' do
        shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
        pet = shelter.pets.create!(sex: :female, name: "Jimmy", approximate_age: 4, description: 'super cute')

        expect(Pet.match('IMM')).to eq([pet])
      end
    end
  end
end
