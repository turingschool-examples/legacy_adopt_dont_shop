require 'rails_helper'

RSpec.describe 'the Application show page' do
  before :each do
    @application1 = Application.create!(
      name: 'Diana Espinoza',
      address: '1712 Circus Ave.',
      city: 'Cloudy',
      state: 'BA',
      zip: 68705,
      description: "I've had pets all my life, and I have really been wanting a cat! I am aware of the responsabilities that come along with a fur baby, and the bond that will form will make them all worth it!"
    )
  end

  it 'should display the name of the applicant, full address, description, names of pets, application status' do

    visit "/applications/#{@application1.id}"

    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.address)
    expect(page).to have_content(@application1.city)
    expect(page).to have_content(@application1.state)
    expect(page).to have_content(@application1.zip)
    expect(page).to have_content(@application1.description)
    expect(page).to have_content(@application1.status)
  end

  # it 'displays a section to add pets to the application when not submitted' do
  #     # it 'can search for Pets by name' do
  #
  #       visit "/applications/#{@application1.id}"
  #
  #       find_field("Add a Pet to this Application")
  #     # end
  # end
end
