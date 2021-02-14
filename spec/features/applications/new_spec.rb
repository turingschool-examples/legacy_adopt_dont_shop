require 'rails_helper'

RSpec.describe 'New Application Page', type: :feature do
  it 'can create a new application' do
    visit '/applications/new'

    fill_in "Name", with: 'Trevor Suter'
    fill_in "Street address", with: '1275 S Birch Dr.'
    fill_in "City", with: 'Denver'
    fill_in "State", with: 'CO'
    fill_in "Zip", with: 80246
    fill_in "Description", with: 'I love dogs'

    click_on 'Save'
    expect(current_path).to eq("/applications/#{(Application.where(name: "Trevor Suter")).ids.first}")
  end
end