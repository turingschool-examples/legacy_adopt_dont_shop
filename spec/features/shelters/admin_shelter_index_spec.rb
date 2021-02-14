require 'rails_helper'

RSpec.describe 'Admin Shelters Index page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "ZZZ", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
  end

  it 'as an admin, see all shelters in reverse alpha order' do
    visit 'admin/shelters'

    expect(page).to have_content(@shelter3, @shelter2, @shelter1)
  end

end
