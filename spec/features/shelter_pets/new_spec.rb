require 'rails_helper'

RSpec.describe 'From shelter pets index page create new pet' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @shelter3 = create(:shelter)
    @pet1 = create(:pet, shelter_id: @shelter1.id)
    @pet2 = create(:pet, shelter_id: @shelter2.id)
    @pet3 = create(:pet, shelter_id: @shelter1.id)
  end

  it "can create a new pet from Shelter Pet index page" do

    visit "/shelters/#{@shelter1.id}/pets"

    click_link "Add Pet"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

    fill_in "image", with: ""
    fill_in "name", with: 'Apollo'
    fill_in "description", with: 'Dog'
    fill_in "approximate_age", with: 3
    fill_in "sex", with: "male"

    click_on 'Create Pet'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")

    expect(page).to have_content("")
    expect(page).to have_content("Apollo")
    expect(page).to have_content(3)
    expect(page).to have_content("male")
  end
end
