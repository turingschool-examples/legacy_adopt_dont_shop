require 'rails_helper'

describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
  end

  describe "class methods" do
    it "pending_shelters" do
      shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      shelter2 = Shelter.create!(name: "Shady Shelter 2", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      pet1 = shelter1.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
      pet2 = shelter2.pets.create!(name: "Fluffy 2", approximate_age: 3, sex: 'male', description: 'super cute')
      application1 = Application.create(applicant: "John Doe", description: "I love dogs!!!", address: "123 Street", city: "Denver", state: 'Colorado', zip: "80410")
      application2 = Application.create(applicant: "John Doe", description: "I love dogs!!!", address: "123 Street", city: "Denver", state: 'Colorado', zip: "80410")

      ApplicationPet.create(pet: pet1, application: application1)
      ApplicationPet.create(pet: pet2, application: application2, status: "Approved")
      expect(Shelter.pending_shelters).to eq([shelter1])
    end
  end

  describe "instance methods" do
    it "formatted_address" do
      shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      expect(shelter1.formatted_address).to eq("123 Shady Ave Denver, CO 80011")
    end
  end
end
