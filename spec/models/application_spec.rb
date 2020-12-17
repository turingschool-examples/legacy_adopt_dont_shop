require 'rails_helper'

RSpec.describe Application, type: :model do
  describe "relationships" do
    it { should have_many :application_pets}
    it {should have_many(:pets).through(:application_pets)}
  end

  describe "class methods" do
    it 'finds pets with a variety of parameters' do
      @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
      @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
      @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
      @application1 = Application.create!(name: "Robert Heath", street: "521 E Thornhill Ave", city: "McAllen", state: "TX", zip: "78503", description: "I have always wanted a dog and would train him or her and would make sure they have lots of food.", status: "In progress")

      expect(Application.find_pet('Thor')).to eq([@pet1])
      expect(Application.find_pet('Th')).to eq([@pet1, @pet2])
      expect(Application.find_pet('AtHeNa')).to eq([@pet2])
    end
  end
end
