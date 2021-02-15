require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications show page' do
    it 'I see name link of applicant and its attributes' do

      @applicant1 = Application.create!(name: 'Melissa', street_address: "123 Main", city: "Denver", state: "CO", zip_code: 80205, description: "I like furry pets")

      visit "/applications/#{@applicant1.id}"

      expect(page).to have_content(@applicant1.name)
      expect(page).to have_content(@applicant1.street_address)
      expect(page).to have_content(@applicant1.city)
      expect(page).to have_content(@applicant1.state)
      expect(page).to have_content(@applicant1.zip_code)
      expect(page).to have_content(@applicant1.description)
      expect(page).to have_content(@applicant1.status)

    end
  end
end
