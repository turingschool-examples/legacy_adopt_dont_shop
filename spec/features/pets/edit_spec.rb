require 'rails_helper'

RSpec.describe 'Update pet from pet show page' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @shelter3 = create(:shelter)
    @pet1 = create(:pet, shelter_id: @shelter1.id, name: "Thor")
    @pet2 = create(:pet, shelter_id: @shelter2.id)
    @pet3 = create(:pet, shelter_id: @shelter1.id)
  end

  it "can update a shelter from the shelter show page" do
    visit "/pets/#{@pet1.id}"

    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{@pet1.id}/edit")

    fill_in "name", with: "Thora"
    fill_in "approximate_age", with: 5
    fill_in "sex", with: "female"
    # fill_in "state", with: 'PA'
    # fill_in "zip", with: 12345

    click_button("Update")

    expect(current_path).to eq("/pets/#{@pet1.id}")

    expect(page).to have_content("Name: Thora")
    expect(page).to have_content("Approx Age: 5")
    expect(page).to_not have_content("Approx Age: 2")
    expect(page).to have_content("Sex: female")
    expect(page).to_not have_content("Sex: male")
  end
end
