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
end