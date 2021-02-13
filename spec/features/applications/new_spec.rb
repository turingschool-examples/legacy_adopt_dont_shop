require 'rails_helper'

RSpec.describe 'As a Visitor' do
  before :each do
  	@application_1 = Application.create!(name: 'Ben')
  end


  it 'can navigate to the pet index page' do
  	visit '/pets'

  	expect(page).to have_content("Start an Application")
  	expect(page).to have_link(href: "/applications/new")

  	click_link("Start an Application")

  	expect(current_path).to eq("/applications/new")
  end

end