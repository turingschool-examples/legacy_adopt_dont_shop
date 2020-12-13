require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications show page' do
    it 'I see name of applicant, address and description' do

      joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
      
      shelter = create(:shelter)
      pet_1 = create(:pet, shelter: shelter)
      pet_2 = create(:pet, shelter: shelter)

      pet_app = PetApplication.create!(application: joe, pet: pet_1)

      

      visit "/applications/#{joe.id}"

      expect(page).to have_content(joe.name)
      expect(page).to have_content(joe.street_address)
      expect(page).to have_content(joe.city)
      expect(page).to have_content(joe.state)
      expect(page).to have_content(joe.zip)
      expect(page).to have_content("In Progress")

      expect(page).to have_content(pet_1.name)
    end
  end
end