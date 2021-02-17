require 'rails_helper'

RSpec.describe 'Create Shelter from index page' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
  end

  it "Visitor can create a new shelter" do
    visit '/shelters'

    click_link 'New Shelter'

    expect(current_path).to eq('/shelters/new')

    fill_in "name", with: 'Pa and Paws'
    fill_in "address", with: 'road avenue'
    fill_in "city", with: 'Pitt'
    fill_in "state", with: 'PA'
    fill_in "zip", with: 12345

    click_on 'Create Shelter'

    expect(current_path).to eq('/shelters')

    expect(page).to have_content("Pa and Paws")
  end
end
