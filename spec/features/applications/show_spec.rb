require 'rails_helper'

describe "Applications show page" do
  it "can see the attributes and information associated with an application" do
    @application1 = Application.create!(
      name: "Bob Ross", address: "123 Paint Spill Lane", city: "Denver",
      state: "Colorado", zip: 80224, description: "I love animals")

    visit "/applications/#{@application1.id}"

    expect(page).to have_content("Applicant Name: #{@application1.name}")
    expect(page).to have_content("Street Address: #{@application1.address}")
    expect(page).to have_content("City: #{@application1.city}")
    expect(page).to have_content("State: #{@application1.state}")
    expect(page).to have_content("Zip Code: #{@application1.zip}")
    expect(page).to have_content("Why the applicant says they'd be a good home: #{@application1.description}")
    expect(page).to have_content("Pets Applied For:")
    expect(page).to have_content("Application Status: #{@application1.status}")
  end
end
