require 'rails_helper'
#
describe 'As a visitor' do
  describe 'When I visit a new application page and click submit with a blank field' do
    it 'Cannot create an application with missing information' do

       visit '/applications/new'

       click_button 'Submit'

       expect(page).to have_content("Error: Required information missing.")
       expect(page).to have_button("Submit")
     end
   end
end

# RSpec.describe 'Create Application' do
# it 'start and application' do
#   visit '/pets'
#
#   expect(page).to have_link("Start Application")
#
#   click_link 'Start an Application'
#   visit "/applications/new"
#
#
#   # expect(current_path).to eq("/applications/new")
#
#   fill_in "name", with: "Josh"
#   fill_in "address", with: "123 Main"
#   fill_in "city", with: "Denver"
#   fill_in "state", with:"C0"
#   fill_in "zip code", with: "80205"
#   fill_in "description", with: "I like furry animals"
#
#   click_on "Submit"
#    app = Application.all
#   expect(current_path).to eq("/applications/#{app.first.id}")
#
#   end
#
#     it 'Cannot create an application with missing information' do
#
#     visit '/applications/new'
#
#     click_button 'Submit'
#
#     expect(page).to have_content("Error: Required information missing.")
#     expect(page).to have_button("Submit")
#   end
# end

#

# applicant1 = Application.create!(name: 'Josh', street_address: "123 Main", state: "CO", zip_code: 80205, description: "I like furry pets")

# Starting an Application, Form not Completed
#
# As a visitor
# When I visit the new application page
# And I fail to fill in any of the form fields
# And I click submit
# Then I am taken back to the new applications page
# And I see a message that I must fill in those fields.
