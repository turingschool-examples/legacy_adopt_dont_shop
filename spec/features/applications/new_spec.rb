require 'rails_helper'

RSpec.describe 'Create Application from Pet Index page' do 
  before :each do 
    @application1 = Application.create!(name: "Jake", street: "123 Main St", city: "Denver", state: "CO", zip: "80210", description: "I love animals", status: "In Progress")
    @application2 = Application.create!(name: "Bri", street: "456 Adams St", city: "Boulder", state: "CO", zip: "80235", description: "Cats rule", status: "In Progress")
  end

  it "Visitors can create a new application" do 
    visit '/pets'

    click_link 'Start an Application'

    expect(current_path).to eq('/applications/new')

    fill_in "name", with: "Adam"
    fill_in "street", with: "1137 Broadway"
    fill_in "city", with: "Thornton"
    fill_in "state", with: "CO"
    fill_in "zip", with: "80415"

    click_button 'Submit'
    
    # expect(current_path).to eq("/applications/#{@application.id}")

    expect(page).to have_content("Adam")
    expect(page).to have_content("In Progress")
    # save_and_open_page
  end
end