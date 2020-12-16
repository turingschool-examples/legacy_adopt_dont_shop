require 'rails_helper'

describe 'As a visitor' do
  describe 'when i visit the admin shelter index' do
    before :each do
      @shelter1 = Shelter.create!(name: "A", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "B", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @shelter3 = Shelter.create!(name: "C", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    end

    it 'Then I see all Shelters in the system listed in reverse alphabetical order by name' do
      visit shelters_path

      within "#shelter-#{@shelter3.id}" do
        expect(page).to have_content(@shelter3.name)
      end

      within "#shelter-#{@shelter2.id}" do
        expect(page).to have_content(@shelter2.name)
      end

      within "#shelter-#{@shelter1.id}" do
        expect(page).to have_content(@shelter1.name)
      end
    end
  end
end