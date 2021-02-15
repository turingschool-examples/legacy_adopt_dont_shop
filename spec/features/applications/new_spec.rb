require 'rails_helper'

RSpec.describe 'From pets index page start new application' do
  before :each do
        @application1 = Application.create!(
          name: 'Diana Espinoza',
          address: '1712 Circus Ave.',
          city: 'Cloudy',
          state: 'BA',
          zip: 68705,
          description: 'I love animals!'
      )
  end

  it 'can start a new application from Pets index page' do
    Application.destroy_all

    visit '/pets'
    click_link 'Start an Application'
    expect(current_path).to eq("/applications/new")

    fill_in "name", with: "Kreg"
    fill_in "address", with: "125 Rainbow"
    fill_in "city", with: "Joel"
    fill_in "state", with: "VA"
    fill_in "zip", with: 58736
    fill_in "description", with: "I love dogs!"

    click_on 'Submit' # visually works with saop but submit does not work properly in local server. SOLVED. Had to add local : true.

    expect(current_path).to eq("/applications/#{Application.first.id}")
    expect(page).to have_content("Kreg")
    expect(page).to have_content("125 Rainbow")
    expect(page).to have_content("Joel")
    expect(page).to have_content("VA")
    expect(page).to have_content(58736)
    expect(Application.all.count).to eq(1)
  end

#   it 'can assing an In Progress status to a new application' do
#     visit "/applications/#{@application1.id}"
# binding.pry
#     expect(page).to have_content("In Progress")
#   end

  it 'displays notice when all fields are NOT filled in' do
    Application.destroy_all

    notice = 'Form must be completed in order to submit the application. Please complete every field in the form.'

    visit '/applications/new'

    fill_in "name", with: "Kreg"
    fill_in "address", with: "125 Rainbow"
    fill_in "city", with: "Joel"
    fill_in "state", with: "VA"
    fill_in "zip", with: 58736
    fill_in "description", with: ""

    click_on 'Submit'

    expect(page).to have_content(notice)
    expect(current_path).to eq('/applications/new')
  end
end
