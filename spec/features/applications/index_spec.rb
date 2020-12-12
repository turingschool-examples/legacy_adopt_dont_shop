require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications index page' do
    it 'displays names of all applications' do 
      joe = Application.create(name: 'Joe', street_address: "12 Broadway", state: "CO", zip: 80303) 
      visit '/applications'

      expect(page).to have_content(joe.name)

    end
  end
end