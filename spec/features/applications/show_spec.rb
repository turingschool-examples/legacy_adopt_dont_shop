require 'rails_helper'

RSpec.describe 'Applications index page' do
  before :each do
    @applicant_1 = create(:application)
    @applicant_2 = create(:application, name: "John Doe, Jr.")
    @applicant_3 = create(:application, name: "Jane Doe")
  end

  it "displays an applicant with corresponding id and attributes" do
    visit "/applicants/#{@applicant_1.id}"

    save_and_open_page

    expect(page).to have_content("Name: #{@applicant_1.name}")
    expect(page).to have_content("Address: #{@applicant_1.address}")
    expect(page).to have_content("City: #{@applicant_1.city}")
    expect(page).to have_content("State: #{@applicant_1.state}")
    expect(page).to have_content("Zip: #{@applicant_1.zip}")
    expect(page).to have_content("Reason for Adoption: #{@applicant_1.reason}")
    expect(page).to have_content("Name of pet(s): #{@applicant_1.names_of_pets}")
    expect(page).to have_content("Application Status: #{@applicant_1.application_status}")
  end
end
