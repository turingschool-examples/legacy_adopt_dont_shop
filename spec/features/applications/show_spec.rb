require 'rails_helper'

RSpec.describe 'As a vistor visiting the Applications show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    PetApplication.create!(pet: @apollo, application: @app1)
    PetApplication.create!(pet: @eros, application: @app1)
  end

  it 'Shows Application attributes' do
    visit "/applications/#{@app1.id}"
      expect(page).to have_content(@app1.name)
      expect(page).to have_content(@app1.street_address)
      expect(page).to have_content(@app1.city)
      expect(page).to have_content(@app1.state)
      expect(page).to have_content(@app1.zipcode)
      expect(page).to have_content(@app1.status)
      expect(page).to have_content(@app1.description)

    within("#pet_section") do
      expect(page).to have_link(@apollo.name)
      expect(page).to have_link(@eros.name)
    end

    click_link(@apollo.name)
    expect(current_path).to eq("/pets/#{@apollo.id}")
  end
end
