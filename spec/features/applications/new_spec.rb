require 'rails_helper'

RSpec.describe 'the new application form page' do
  it 'redirects and creates on submission' do
    visit '/applications/new'

    expect(page).to have_content('New Application Form')

    fill_in 'name', with: 'Tony S'
    fill_in 'address', with: '334 Ridge Road'
    fill_in 'city', with: 'Golden'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: 80401
    fill_in 'description', with: 'Looking for another cat to be friends with a new kitten'
    click_button 'Submit'

    app = Application.find_by(name: 'Tony S')
    expect(current_path).to eq("/applications/#{app.id}")
  end
end
