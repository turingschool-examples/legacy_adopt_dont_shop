require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit the admin shelter show page' do
    before :each do
      @shelter1 = Shelter.create!(name: "A", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "B", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @shelter3 = Shelter.create!(name: "C", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    end

    it 'Then I see the shelters attributes' do
      visit admin_shelter_path(@shelter1)

      expect(page).to have_content(@shelter1.address)
      expect(page).to have_content(@shelter1.state)
      expect(page).to have_content(@shelter1.city)
      expect(page).to have_content(@shelter1.zip)
      expect(page).to have_link("#{@shelter1.name}'s Pets")
      expect(page).to have_link("Edit Shelter")
      expect(page).to have_button("Delete Shelter")
    end

  end
end