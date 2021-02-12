require 'rails_helper'

RSpec.describe 'Pets index page' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @shelter3 = create(:shelter)
    @pet1 = create(:pet, shelter_id: @shelter1.id)
    @pet2 = create(:pet, shelter_id: @shelter2.id)
    @pet3 = create(:pet, shelter_id: @shelter1.id)
  end

  it "displays each pet in the system with attributes" do

    visit "/pets"

    expect(page).to have_content(@pet1.image)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@shelter1.name)

    expect(page).to have_content(@pet2.image)
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.approximate_age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@shelter2.name)

    expect(page).to_not have_content(@shelter3.name)
  end

  it "can delete a pet from pet index page" do
    visit "/pets"

    within "#pet-#{@pet1.id}" do
      expect(page).to have_content("Thor")
      click_link "Delete Pet"
    end

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Thor")
  end

  it "can edit a pet from pets index page" do
    visit '/pets'

    within "#pet-#{@pet1.id}" do
      expect(page).to have_content("Thor")
      click_link "Update Pet"
    end

    fill_in "name", with: "Calvin"

    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{@pet1.id}")

    expect(page).to have_content("Calvin")
    expect(page).to_not have_content("Thor")
  end
end
