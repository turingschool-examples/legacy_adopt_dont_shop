require 'rails_helper'

RSpec.describe 'Shelter_Pets index page' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @shelter3 = create(:shelter)
    @pet1 = create(:pet, shelter_id: @shelter1.id)
    @pet2 = create(:pet, shelter_id: @shelter2.id)
    @pet3 = create(:pet, shelter_id: @shelter1.id)
  end

  it "displays each pet that can be adopted from that shelter including pet attributes" do

    visit "/shelters/#{@shelter1.id}/pets"

    expect(page).to have_content(@pet1.image)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)

    expect(page).to have_content(@pet3.image)
    expect(page).to have_content(@pet3.name)
    expect(page).to have_content(@pet3.approximate_age)
    expect(page).to have_content(@pet3.sex)

    expect(page).to_not have_content(@pet2.name)
  end
end
