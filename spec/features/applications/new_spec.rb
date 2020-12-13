require 'rails_helper'

RSpec.describe 'Create Application' do

it 'start and application' do
  visit '/pets'

  click_link 'Start an Application'

  expect(current_path).to eq("/applications/new")

  fill_in "name", with: "Joe"
  fill_in "address", with: "12"
  fill_in "city", with: "Boulder"
  fill_in "state", with:"Utah"
  fill_in "zip", with: "34253"

  click_on "Submit"
   app = Application.all
  expect(current_path).to eq("/applications/#{app.first.id}")
end

it 'I can not create an application missing information' do

  visit applications_new_path

  click_button 'Submit'

  expect(page).to have_content("Application not created: Required information missing.")
  expect(page).to have_button("Submit")
end
end