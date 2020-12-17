require 'rails_helper'

RSpec.describe 'As a user' do
  describe "when I visit the Application show page" do
    before :each do
      @shelter1 = FactoryBot.create(:shelter)
      @shelter2 = FactoryBot.create(:shelter)
      @shelter3 = FactoryBot.create(:shelter)
      @pet1 = FactoryBot.create(:pet)
      @pet2 = FactoryBot.create(:pet)
      @pet3 = FactoryBot.create(:pet)

      @application = Application.create(name: 'Billy Bob', 
        address: '123 W Street',
        city: 'Denver',
        state: 'CO',
        zip_code: '80246',
        description: "I love animals.",
        status: "Pending"
      )

      PetApplication.create(application: @application, pet: @pet1)
      PetApplication.create(application: @application, pet: @pet3)

    end

    it "should show application details" do
      visit "/applications/#{@application.id}"
      expect(page).to have_content(@application.name)
      expect(page).to have_content(@application.address)
      expect(page).to have_content(@application.description)
      expect(page).to have_content("Application Status: #{@application.status}")
      expect(page).to have_link(@pet1.name, href: "/pets/#{@pet1.id}")
      expect(page).to have_link(@pet3.name, href: "/pets/#{@pet3.id}")
      expect(page).not_to have_link(@pet2.name, href: "/pets/#{@pet2.id}")
    end    
  end
end