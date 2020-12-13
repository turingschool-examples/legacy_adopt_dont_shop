require 'rails_helper'

describe Application, type: :model do
  before :each do
    @app = Application.create!(name: "James Fox", street: "2286 Huntington Dr", city: "LHC", state: "AZ", zip_code: 86403, description: "I WANT HIM!")
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"puppies.jpeg", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"puppies.jpeg", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"puppies.jpeg", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet_app1 = ApplicationPet.create!(pet_id: @pet1.id, application_id: @app.id)
    @pet_app2 = ApplicationPet.create!(pet_id: @pet2.id, application_id: @app.id)
  end

  describe 'relationships' do
    it { should have_many :application_pets }
    it { should have_many(:pets).through(:application_pets)}
  end

  describe 'instance methods' do
    it "knows all_approved" do

      expect(@app.all_approved).to eq(false)

      @pet_app1.update!({status: true})
      @pet_app2.update!({status: true})

      expect(@app.all_approved).to eq(true)
      expect(@app.not_all_approved).to eq(false)
    end

    it "knows if one is rejected" do

      expect(@app.not_all_approved).to eq(false)
      @pet_app1.update!({status: true})
      @pet_app2.update!({status: false})

      expect(@app.not_all_approved).to eq(true)
      expect(@app.all_approved).to eq(false)
    end

    it "can return a new table with pet and pet app info" do

      expect(@app.pet_apps(@app.id)).to eq([@pet1, @pet2])
    end
  end
end
