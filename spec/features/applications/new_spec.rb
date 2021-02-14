require 'rails_helper'

RSpec.describe 'Applications index page' do
  before :each do
    @applicant_1 = create(:application)
    @applicant_2 = create(:application, name: "John Doe, Jr.", names_of_pets: "Zeus")
    @applicant_3 = create(:application, name: "Jane Doe", names_of_pets: "Goofy")
    @dog_1 = create(:pet)
    @dog_2 = create(:pet, name: "Zeus")
    @dog_3 = create(:pet, name: "Goofy")
  end

  skip "displays a link to 'Start an Application' when on the pet index page" do
    visit "/pets"

    expect(page).to have_link 'Start an Application', href: "/applicants/new"
  end
end
