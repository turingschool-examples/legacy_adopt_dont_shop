require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications show page' do
    it 'I see name of applicant and its attributes' do

      applicant1 = Application.create!(name: 'Josh', street_address: "123 Main", state: "CO", zip_code: 80205, description: "I like furry pets")

      visit "/applications/#{applicant1.id}"

      expect(page).to have_content(applicant1.name)
      expect(page).to have_content(applicant1.street_address)
      expect(page).to have_content(applicant1.state)
      expect(page).to have_content(applicant1.zip_code)
      expect(page).to have_content(applicant1.description)
    end
  end
end


# As a visitor
# When I visit an applications show page
# Then I can see the following:
# - Name of the Applicant
# - Full Address of the Applicant including street address, city, state, and zip_code code
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pets that this application is for (all names of pets should be links to their show page)
# - The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
