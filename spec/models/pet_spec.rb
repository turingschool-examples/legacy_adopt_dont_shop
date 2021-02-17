require 'rails_helper'

RSpec.describe Pet, type: :model do
  before :each do 
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Homeless Animals", address: "789 Silly Ave", city: "Longmont", state: "AZ", zip: 78495)
    @shelter3 = Shelter.create!(name: "Pet Paradise", address: "954 Shelter Dr.", city: "Commerce City", state: "NM", zip: 24897)

    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet4 = @shelter1.pets.create!(image:"", name: "Cuatro", description: "cat", approximate_age: 7, sex: "male")
    @pet5 = @shelter3.pets.create!(image:"", name: "Callie", description: "cat", approximate_age: 10, sex: "female")
    @pet6 = @shelter3.pets.create!(image:"", name: "Anna", description: "dog", approximate_age: 5, sex: "female")
    
    @application1 = Application.create!(name: "Jake", street: "123 Main St", city: "Denver", state: "CO", zip: "80210", description: "I love animals", status: "In Progress")
    @application2 = Application.create!(name: "Bri", street: "456 Adams St", city: "Boulder", state: "CO", zip: "80235", description: "Cats rule", status: "In Progress")

    @PetApp1 = PetApplication.create!(pet_id: @pet1.id, application_id: @application1.id)
    @PetApp2 = PetApplication.create!(pet_id: @pet2.id, application_id: @application1.id)
    @PetApp3 = PetApplication.create!(pet_id: @pet5.id, application_id: @application1.id)
    @PetApp4 = PetApplication.create!(pet_id: @pet1.id, application_id: @application2.id)
    @PetApp5 = PetApplication.create!(pet_id: @pet3.id, application_id: @application2.id)
    @PetApp6 = PetApplication.create!(pet_id: @pet4.id, application_id: @application2.id)
end
  describe 'relationships' do
    it { should belong_to :shelter }
    it { should have_many :pet_applications }
    it { should have_many(:applications).through(:pet_applications)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :sex}
    it {should validate_numericality_of(:approximate_age).is_greater_than_or_equal_to(0)}

    it 'is created as adoptable by default' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      expect(pet.adoptable).to eq(true)
    end

    it 'can be created as not adoptable' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(adoptable: false, name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      expect(pet.adoptable).to eq(false)
    end

    it 'can be male' do
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(sex: :male, name: "Fluffy", approximate_age: 3, description: 'super cute')
      expect(pet.sex).to eq('male')
      expect(pet.male?).to be(true)
      expect(pet.female?).to be(false)
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
    describe '.change_adopt_status' do 
      it 'changes the pet adotaple boolean to false if applicaiton is approved' do
      @PetApp1.update!(status: "Approved")
      @PetApp2.update!(status: "Approved")
      @PetApp3.update!(status: "Approved")
      expect(Pet.find(@pet1.id).adoptable).to eq (true)
      expect(Pet.find(@pet2.id).adoptable).to eq (true)
      expect(Pet.find(@pet5.id).adoptable).to eq (true)
      @application1.change_status(@application1.id)
      expect(Pet.change_adopt_status(@application1.id)).to eq (3)
      expect(Pet.find(@pet1.id).adoptable).to eq (false)
      expect(Pet.find(@pet2.id).adoptable).to eq (false)
      expect(Pet.find(@pet5.id).adoptable).to eq (false)
      end
    end
  end
end
