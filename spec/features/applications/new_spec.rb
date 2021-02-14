require "rails_helper"

RSpec.describe "the Application new page", type: :feature do
  it "redirects user back to new page if form is incomplete" do
    visit "/applications/new"

    click_button("Submit")

    expect(page).to have_content("Incomplete Application: Required information missing.")
    expect(page).to have_button("Submit")
  end
end
