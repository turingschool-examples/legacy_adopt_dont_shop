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
    click_button 'Submit'

    app = Application.find_by(name: 'Tony S')
    expect(current_path).to eq("/applications/#{app.id}")

    expect(page).to have_content('334 Ridge Road')
    expect(page).to have_content('Golden')
    expect(page).to have_content('CO')
    expect(page).to have_content('80401')
    expect(page).to have_content('In Progress')
  end

  describe 'as a visitor' do
    it 'I cannot submit a blank form' do
      visit '/applications/new'

      click_button 'Submit'

      expect(page).to have_content('Application could not be created, please fill in all fields!')
      expect(current_path).to eq('/applications/new')
    end
  end
end
