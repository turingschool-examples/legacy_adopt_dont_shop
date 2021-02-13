require 'rails_helper'

RSpec.describe 'As a Visitor' do
 
  describe'when I navigate to an application index page' do

  	it'displays the names of applicants'do
    application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
  	visit "applications"
    expect(page).to have_content("#{application_1.name}")
  	end
  end
end