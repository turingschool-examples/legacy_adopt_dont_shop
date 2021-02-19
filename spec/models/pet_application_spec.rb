require 'rails_helper'

describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to :pet}
    it { should belong_to :application}
  end

  describe 'validations' do
    it { should validate_presence_of(:pet_id)}
    it { should validate_presence_of(:application_id)}
  end

  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter",
                                address: "123 Shady Ave",
                                city: "Denver",
                                state: "CO",
                                zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"",
                                   name: "Thor",
                                   description: "dog",
                                   approximate_age: 2,
                                   sex: "male")
    @application_1 = Application.create!(name: "Sally",
                                         address: "234 Third Ave",
                                         city: "Dallas",
                                         state: "TX",
                                         zip: 88678,
                                         status: "In Progress")
    @pet_application = PetApplication.create!(application_id: @application_1.id,
                                              pet_id: @pet1.id)
  end
end
