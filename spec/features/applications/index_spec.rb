RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the application index page' do
    before(:each) do
      @ms_jenkins  = Application.create!({name: 'Buttercup Jenkins', street: "101 Puppy Love Lane", city: 'Aurora', state: 'CO', zip: 80017, 
                                          description: 'I love dogs', status: 'In Progress'})
    end

    # it 'I can see the name of application, and the status' do
    #   visit "/applications"

    #   expect(page).to have_link(@ms_jenkins.name)
    # end
  end
end