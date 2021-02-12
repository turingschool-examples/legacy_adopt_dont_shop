require 'rails_helper'

RSpec.describe 'delete shelter' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
  end

  it "can delete a shelter from the shelter show page" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@shelter1.name)

    click_button "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end
end
