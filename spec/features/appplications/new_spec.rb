require 'rails_helper'

RSpec.describe 'Applications new page' do
  # story 3 new page form
  it 'contains a form for filling out a new applicaton' do
    visit '/applications/new'
    fill_in 'application[name]', with: "Dominic"
    fill_in 'application[street]', with: "2298 West 28th Ave"
    fill_in 'application[city]', with: "Denver"
    fill_in 'application[state]', with: "Colorado"
    fill_in 'application[zip_code]', with: 80211
    fill_in 'application[description]', with: 'Owns 10 Cats'

    click_on 'Submit'
    expect(page).to have_content("Dominic")
    expect(page).to have_content("2298 West 28th Ave, Denver, Colorado")
    expect(page).to have_content(80211)
    expect(page).to have_content('Owns 10 Cats')
    expect(page).to have_content("In Progress")
  end
end
