require 'rails_helper'

RSpec.describe 'Admin Shelters Show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "ZZZ", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet4 = @shelter1.pets.create!(image:"", name: "Sparky", description: "dog", approximate_age: 3, sex: "male")
    @pet5 = @shelter1.pets.create!(image:"", name: "Zeus", description: "cat", approximate_age: 8, sex: "female")
  end

  it 'see shelters name and full address' do
    visit "/admin/shelters/#{@shelter1.id}"

    expect(current_path).to eq("/admin/shelters/#{@shelter1.id}")

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.address)
    expect(page).to have_content(@shelter1.city)
    expect(page).to have_content(@shelter1.state)
    expect(page).to have_content(@shelter1.zip)
  end

  it 'shows average pet age' do
    visit "/admin/shelters/#{@shelter1.id}"

    expect(page).to have_selector('#statistics')

    within('#statistics') do
      expect(page).to have_content("Average age: 4.25 years old")
    end
  end

  it 'show number of adoptable pets' do
    visit "/admin/shelters/#{@shelter1.id}"

    within('#statistics') do
      expect(page).to have_content("# of adoptable pets: 4")
    end
  end
end
