require 'rails_helper'

RSpec.describe 'As a vistor visiting the Applications show page' do
  before :each do
    @app1 = Application.create!(
      name: "Guy",
      street_address: "111 Wherever Ln",
      city: "Great Town",
      state: "OH",
      zipcode: 11552,
      status: "In Progress",
      description: "I love pets and have been a longtime pet owner"
    )
  end
  it 'Shows Application attributes' do
    visit "/applications/#{@app1.id}"

    expect(page).to have_content(@app1.name)
    expect(page).to have_content(@app1.street_address)
    expect(page).to have_content(@app1.city)
    expect(page).to have_content(@app1.state)
    expect(page).to have_content(@app1.zipcode)
    expect(page).to have_content(@app1.status)
    expect(page).to have_content(@app1.description)
  end
end
