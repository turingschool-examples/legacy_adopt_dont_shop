require 'rails_helper'

RSpec.describe 'Applications index page' do
  before :each do
    @dominic = Application.create!(name: "Dominic", street: "2298 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 cats", application_status: "Pending" )
    @jordan = Application.create!(name: "Jordan", street: "2300 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 dogs", application_status: "Approved" )
  end

  it "can show appplicant information" do
    visit "/applications"
    expect(page). to have_content(@dominic.name)
    expect(page). to have_content(@dominic.street)
    expect(page). to have_content(@dominic.city)
    expect(page). to have_content(@dominic.state)
    expect(page). to have_content(@dominic.zip_code)
    expect(page). to have_content(@dominic.description)
    expect(page). to have_content(@dominic.application_status)
    expect(page). to have_content(@jordan.name)
    expect(page). to have_content(@jordan.street)
    expect(page). to have_content(@jordan.city)
    expect(page). to have_content(@jordan.state)
    expect(page). to have_content(@jordan.zip_code)
    expect(page). to have_content(@jordan.description)
    expect(page). to have_content(@jordan.application_status)
  end
end
