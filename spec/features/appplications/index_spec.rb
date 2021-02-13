require 'rails_helper'

RSpec.describe 'Applications index page' do
  before :each do
    @dominic = Application.create!(name: "Dominic", street: "2298 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 cats", application_status: "Pending" )
    @jordan = Application.create!(name: "Jordan", street: "2300 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 dogs", application_status: "Approved" )
  end

  it "can show appplicant names leading to show page" do
    visit "/applications"
    within("#application-#{@dominic.id}") do
    expect(page).to have_link(@dominic.name)
    click_link(@dominic.name)
    expect(current_path).to eq("/applications/#{@dominic.id}")
    end
  end
end
