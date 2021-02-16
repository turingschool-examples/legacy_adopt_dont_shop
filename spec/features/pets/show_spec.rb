require 'rails_helper'

RSpec.describe 'Pets index page' do
  before :each do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @shelter3 = create(:shelter)
    @pet1 = create(:pet, shelter_id: @shelter1.id, name: "Thor")
    @pet2 = create(:pet, shelter_id: @shelter2.id)
    @pet3 = create(:pet, shelter_id: @shelter1.id)
  end

  it "displays pet w/ corresponding id with attributes and adoptable status" do

    visit "/pets/#{@pet1.id}"

    expect(page).to have_content(@pet1.image)
    expect(page).to have_content("Name: #{@pet1.name}")
    expect(page).to have_content("Description: #{@pet1.description}")
    expect(page).to have_content("Approx Age: #{@pet1.approximate_age}")
    expect(page).to have_content("Sex: #{@pet1.sex}")
    expect(page).to have_content("Adoption Status: #{@pet1.adoptable?}")
  end
end
