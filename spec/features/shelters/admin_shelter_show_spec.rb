require 'rails_helper'

RSpec.describe 'Admin Shelters Show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "ZZZ", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
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
end
