require 'rails_helper'

RSpec.describe "Applications Show page", type: :feature do

  describe "When I visit an application's show page" do
    it "can see all of it's attributes" do
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
      )
      maddie = Application.create!(
        name: "Maddie Suter",
        street_address: "12 Birch Lane",
        city: "Denver",
        state: "CO",
        zip: 80246,
        description: "I love cats",
      )
      ApplicationPet.create!(application: trevor, pet: rico)
      ApplicationPet.create!(application: trevor, pet: saki)
      ApplicationPet.create!(application: maddie, pet: saki)
      visit "/applications/#{trevor.id}"
      expect(page).to have_content(trevor.name)
      expect(page).to have_content(trevor.street_address)
      expect(page).to have_content(trevor.city)
      expect(page).to have_content(trevor.state)
      expect(page).to have_content(trevor.zip)
      expect(page).to have_content(trevor.description)
      expect(page).to have_content(rico.name)
      expect(page).to have_content(saki.name)
      expect(page).to have_content(trevor.status)

      visit "/applications/#{maddie.id}"
      expect(page).to have_content(maddie.name)
      expect(page).to have_content(maddie.street_address)
      expect(page).to have_content(maddie.city)
      expect(page).to have_content(maddie.state)
      expect(page).to have_content(maddie.zip)
      expect(page).to have_content(maddie.description)
      expect(page).to have_content(saki.name)
      expect(page).to have_content(maddie.status)
    end

    it 'has links to the pets on the application' do
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
      visit "/applications/#{trevor.id}"
      expect(page).to have_link("#{rico.name}", href: "/pets/#{rico.id}")
      expect(page).to have_link("#{saki.name}", href: "/pets/#{saki.id}")

    end
  end
end