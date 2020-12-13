require 'rails_helper'

RSpec.describe 'Applications Show Page' do
  describe 'As a visitor' do
    it 'shows the name, address, description, links of all pets and approval status' do
      isabelle = UserApplication.create!(name: 'Isabelle',
                                     address: '1234 Downing St', 
                                     city: 'Denver', 
                                     state: 'CO', 
                                     zip: '80218',
                                     description: 'i give a lot of pets to my pets.',
                                     status: 'Accepted')

      visit "/applications/#{isabelle.id}"
      
      expect(page).to have_content(isabelle.name)
      expect(page).to have_content(isabelle.address)
      expect(page).to have_content(isabelle.city)
      expect(page).to have_content(isabelle.state)
      expect(page).to have_content(isabelle.zip)
      expect(page).to have_content(isabelle.description)
      expect(page).to have_content(isabelle.status)
    end
  end
end
