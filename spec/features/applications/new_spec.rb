require 'rails_helper'

RSpec.describe 'As a Visitor' do

  it 'can navigate to the pet index page and start an applicaiton' do
  	visit '/pets'

  	expect(page).to have_content("Start an Application")
  	expect(page).to have_link(href: "/applications/new")

  	click_link("Start an Application")

  	expect(current_path).to eq("/applications/new")
  	fill_in("name", with:'Ben')
  	fill_in("street", with:'123 street')
  	fill_in("city", with:'denver')
  	fill_in("state", with:'co')
  	fill_in("zip", with:'12332')
  	click_button("Submit")

  	within("#shown-app") do
			expect(page).to have_content("Ben")
			expect(page).to have_content("123 street,denver,co,12332")
  	end
  end

  it'shows an error message when leaving fields empty'do
  	visit '/pets'

  	expect(page).to have_content("Start an Application")
  	expect(page).to have_link(href: "/applications/new")

  	click_link("Start an Application")

  	expect(current_path).to eq("/applications/new")
  	fill_in("name", with:'Ben')
  	fill_in("street", with:'123 street')
  	fill_in("city", with:'denver')
  	click_button("Submit")

  	expect(page).to have_content("Missing fields, please fill in all info.")

	end


end