require 'rails_helper'

RSpec.describe "factory bot" do
  it "can create pets and shelters" do

    shelter = create(:shelter)
    pet = create(:pet, shelter_id: shelter.id)

    expect(shelter.name.class).to eq(String)
    expect(pet.class).to eq(Pet)
    expect(shelter.class).to eq(Shelter)
  end
end
