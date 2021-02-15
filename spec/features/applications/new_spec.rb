require 'rails_helper'
#
RSpec.describe 'As a visitor' do
  before :each do
    @application1 = Application.all
  end

it 'I start and application on pet index' do
  visit '/pets'

  click_link 'Start an Application'

  expect(current_path).to eq("/applications/new")

  fill_in "name", with: "Melissa"
  fill_in "address", with: "123 Main"
  fill_in "city", with: "Denver"
  fill_in "state", with:"CO"
  fill_in "zip_code", with: "80205"
  fill_in "description", with: "I like furry pets"


  click_on "Submit"

  expect(current_path).to eq("/applications/#{@application1.first.id}")
  expect(page).to have_content('Melissa')

end


#
describe 'As a visitor' do
  describe 'I am taken to  a new application page from pet index and click submit with a blank field' do
    it 'Cannot create an application with missing information' do

       visit '/applications/new'

       click_button 'Submit'

       expect(page).to have_content("Error: Required information missing.")
       expect(page).to have_button("Submit")
     end
   end
 end
end
