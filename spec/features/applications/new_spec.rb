require 'rails_helper'

RSpec.describe 'New Application Page', type: :feature do
  it 'can create a new application' do
    visit '/applications/new'

    fill_in "name", with: 'Trevor Suter'
    fill_in "address", with: '1275 S Birch Dr.'
    fill_in "city", with: 'Denver'
    fill_in "state", with: 'CO'
    fill_in "zip", with: 80246
    fill_in "description", with: 'I love dogs'

    click_on 'Create Application'

    expect(current_path).to eq('/applications/#{(Application.where(name: "Trevor Suter")).id}')
  end
end