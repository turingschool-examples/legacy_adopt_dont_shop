require 'rails_helper'

RSpec.describe 'Shelters index page' do
  before :each do
    @shelter1 = create(:shelter, name: "Shady Shelter")
    @shelter2 = create(:shelter, name: "Silly Shelter")
  end

  it "displays names of all shelters" do
    visit '/shelters'
    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end

  it "can edit a shelter from index page" do
    visit '/shelters'

    within "#shelter-#{@shelter1.id}" do
      expect(page).to have_content("Shady Shelter")
      click_link "Edit Shelter"
    end

    fill_in "name", with: "Shoddy Shelter"
    click_button "Update Shelter"
    expect(current_path).to eq("/shelters/#{@shelter1.id}")

    expect(page).to have_content("Shoddy Shelter")
    expect(page).to_not have_content("Shady Shelter")
  end

  it "can delete a shelter from index page" do
    visit "/shelters"

    within "#shelter-#{@shelter1.id}" do
      expect(page).to have_content("Shady Shelter")
      click_link "Delete Shelter"
    end

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content("Shady Shelter")
  end

  it "Update Shelter edit and delete next to every shelter" do
    visit "/shelters"

    expect(page).to have_content("Shady Shelter")

    within "#shelter-#{@shelter1.id}" do
      expect(page).to have_link("Edit Shelter")

      click_link "Edit Shelter"
    end

      fill_in "name", with: 'Poo and Paws'

      click_button("Update Shelter")

      expect(current_path).to eq("/shelters/#{@shelter1.id}")

      expect(page).to have_content("Poo and Paws")
      expect(page).to_not have_content("Shady Shelter")

      visit "/shelters"

      within "#shelter-#{@shelter1.id}" do
        expect(page).to have_link("Delete Shelter")
        click_link "Delete Shelter"
      end
      expect(page).to_not have_content("Poo and Paws")

  end
end
