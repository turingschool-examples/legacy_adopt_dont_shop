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
