require 'rails_helper'

describe "create new app" do
  it "can create new app" do
    visit pets_path
    click_on "Start an Application"

    fill_in 'name', with: "James"
    fill_in 'street', with: "1800 nonyabiz"
    fill_in 'city', with: "LHC"
    fill_in 'state', with: "AZ"
    fill_in 'zip_code', with: 86403
    click_on "Submit"

    expect(page).to have_content("James")
  end

  it "can test flash notice" do
    visit pets_path
    click_on "Start an Application"

    fill_in 'name', with: "James"
    fill_in 'street', with: "1800 nonyabiz"
    fill_in 'city', with: "LHC"
    click_on "Submit"

    expect(page).to have_content("Application not created: Required information missing.")
  end
end
