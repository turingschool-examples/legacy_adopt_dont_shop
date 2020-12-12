require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications show page' do
    it 'I see name of applicant, address and description' do

      joe = Application.create!(name: 'Joe', street_address: "12 Broadway", state: "CO", zip: 80303)
    
      visit "/applications/#{joe.id}"

      expect(page).to have_content(joe.name)
      expect(page).to have_content(joe.street_address)
      expect(page).to have_content(joe.state)
      expect(page).to have_content(joe.zip)
    end
  end
end