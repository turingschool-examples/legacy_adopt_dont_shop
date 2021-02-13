require 'rails_helper'

RSpec.describe 'From pets index page start new application' do
  before :each do
        @application1 = Application.create!(
          name: 'Diana Espinoza',
          address: '1712 Circus Ave.',
          city: 'Cloudy', state: 'BA',
          zip: 68705,
        )
  end

  it 'can start a new application from Pets index page' do
    visit '/pets'
    click_link 'Start an Application'
    expect(current_path).to eq("/applications/new")

    fill_in "name", with: "#{@application1.name}"
    fill_in "address", with: "#{@application1.address}"
    fill_in "city", with: "#{@application1.city}"
    fill_in "zip", with: "#{@application1.zip}"

    click_on 'Submit'

    expect(current_path).to eq("/applications/#{@application1.id}/show")
  end
end
