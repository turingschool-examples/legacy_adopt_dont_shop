require 'rails_helper'

describe "applications new page" do
  it "has a form for an applicant to fill out, submit and be redirected to show page" do
    visit "/applications/new"

    expect(page).to have_content("Name")
    expect(page).to have_content("Street Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip code")
    expect(page).to have_content("Why would you be a good home for this animal?")
    expect(page).to have_field("name")
    expect(page).to have_field("address")
    expect(page).to have_field("city")
    expect(page).to have_field("state")
    expect(page).to have_field("zip")
    expect(page).to have_field("description")
    expect(page).to have_button("Submit Application")

    fill_in "name", with: "John Smith"
    fill_in "address", with: "789 Main St"
    fill_in "city", with: "Denver"
    fill_in "state", with: "Colorado"
    fill_in "zip", with: 80224
    fill_in "description", with: "I love cats."

    click_on "Submit Application"

    app_1 = Application.last

    expect(current_path).to eq("/applications/#{app_1.id}")

    expect(page).to have_content("In Progress")
    expect(page).to have_content("John Smith")
    expect(page).to have_content("789 Main St")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Colorado")
    expect(page).to have_content("80224")
    expect(page).to have_content("I love cats.")
  end
end
