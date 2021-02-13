require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it {should have_many :application_pets}
    it {should have_many(:pets).through(:application_pets)}
  end

  it 'can find an applicants pets' do
    ddfl = Shelter.create!(
      name: "Denver Dumb Friends League",
      address: "123 Doggie Lane",
      city: "Denver",
      state: "CO",
      zip: 80246
    )
    rico = ddfl.pets.create!(
      name: "Rico",
      approximate_age: 4,
      description: "Staffordshire Terrier",
      sex: "male"
    )
    saki = ddfl.pets.create!(
      name: "Saki",
      approximate_age: 5,
      description: "mutt",
      sex: "female"
    )
    trevor = Application.create!(
      name: "Trevor Suter",
      street_address: "1275 Birch Lane",
      city: "Denver",
      state: "CO",
      zip: 80220,
      description: "I love dogs",
      status: "In Progress"
    )

    ApplicationPet.create!(application: trevor, pet: rico)
    ApplicationPet.create!(application: trevor, pet: saki)
    expect(trevor.pets).to eq([rico, saki])
  end
end