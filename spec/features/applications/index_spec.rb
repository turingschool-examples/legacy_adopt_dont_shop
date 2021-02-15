require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications index page' do
    it 'I see list of all applicants' do
      applicant1 = Application.create!(name: 'Melissa', street_address: "123 Main", city: "Denver", state: "CO", zip_code: 80205, description: "I like furry pets")
      visit '/applications'

      expect(page).to have_content(applicant1.name)
    end
  end
end
