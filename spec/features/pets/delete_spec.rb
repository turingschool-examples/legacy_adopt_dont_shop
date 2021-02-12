require 'rails_helper'

RSpec.describe 'Delete pet from pet show page' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @shelter3 = create(:shelter)
    @pet1 = create(:pet, shelter_id: @shelter1.id, name: "Thor")
    @pet2 = create(:pet, shelter_id: @shelter2.id)
    @pet3 = create(:pet, shelter_id: @shelter1.id)
  end

  it "can delete a pet from the pet show page" do
    visit "/pets/#{@pet1.id}"

    expect(page).to have_content(@pet1.name)

    click_button "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to_not have_content(@pet1.name)
    expect(page).to have_content(@pet2.name)
  end
end
