require 'rails_helper'

describe Pet, type: :model do
  before :each do
    @shelter = Shelter.create!(name: 'Pet Rescue',
                               address: '123 Adoption Ln.',
                               city: 'Denver',
                               state: 'CO',
                               zip: '80222')
    @pet = @shelter.pets.create!(name: "Fluffy",
                                 approximate_age: 3,
                                 sex: 'male',
                                 description: 'super cute')
    @pet1 = @shelter.pets.create!(image:"",
                                  name: "Thor",
                                  description: "dog",
                                  approximate_age: 2,
                                  sex: "male")
    @pet2 = @shelter.pets.create!(image:"",
                                  name: "Athena",
                                  description: "cat",
                                  approximate_age: 3,
                                  sex: "female")
    @pet3 = @shelter.pets.create!(image:"",
                                  name: "Zeus",
                                  description: "dog",
                                  approximate_age: 4,
                                  sex: "male")
  end

  describe 'relationships' do
    it { should belong_to :shelter }
    it { should have_many :pet_applications }
    it { should have_many(:applications).through(:pet_applications) }

  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :sex}
    it {should validate_numericality_of(:approximate_age).is_greater_than_or_equal_to(0)}

    it 'is created as adoptable by default' do
      expect(@pet.adoptable).to eq(true)
    end

    it 'can be created as not adoptable' do
      pet = @shelter.pets.create!(adoptable: false,
                                 name: "Fluffy",
                                 approximate_age: 3,
                                 sex: 'male',
                                 description: 'super cute')
      expect(pet.adoptable).to eq(false)
    end

    it 'can be male' do
      expect(@pet.sex).to eq('male')
      expect(@pet.male?).to be(true)
      expect(@pet.female?).to be(false)
    end

    it 'can be female' do
      pet = @shelter.pets.create!(sex: :female,
                                 name: "Fluffy",
                                 approximate_age: 3,
                                 description: 'super cute')
      expect(pet.sex).to eq('female')
      expect(pet.female?).to be(true)
      expect(pet.male?).to be(false)
    end
  end

  describe 'class methods' do
    it 'can search for a name' do
      search = {search: "Fluffy"}
      expected = Pet.search(search)
      expect(expected.first.name).to eq("Fluffy")
    end

    it 'can find average age of pets' do
      expect(Pet.average_age).to eq(3)
    end

    it 'can find number of adoptable pets' do
      expect(Pet.adoptable_count).to eq(4)
    end
  end
end
