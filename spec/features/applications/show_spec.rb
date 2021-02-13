require 'rails_helper'

RSpec.describe 'As a Visitor' do
  before :each do
  	@application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
  end
  describe'when I navigate to an application show page' do

  	it'displays the information about the application'do
  	visit "applications/#{@application_1.id}"

  	within("#shown-app") do
			expect(page).to have_content("Ben")
			expect(page).to have_content("123 street,Denver,CO,80220")
  	end

  	


  	end

  end

end