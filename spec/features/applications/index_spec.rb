require 'rails_helper'

describe "applications index page" do
  it "has a link to Start an Application" do
    visit '/applications'
    
    expect(page).to have_link("Start an Application")
  end
end
