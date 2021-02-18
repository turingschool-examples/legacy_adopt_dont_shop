require 'rails_helper'

RSpec.describe 'Admin Shelters Index page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "ZZZ", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
  end

  it 'as an admin, see all shelters in reverse alpha order' do
    visit '/admin/shelters'

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

  it 'every shelter name is a link that goes to their show page' do
    visit '/admin/shelters'

    within("#shelter-#{@shelter1.id}") do
      expect(page).to have_link("#{@shelter1.name}")

      click_on("#{@shelter1.name}")

      expect(current_path).to eq("/admin/shelters/#{@shelter1.id}")
    end 
  end
end
