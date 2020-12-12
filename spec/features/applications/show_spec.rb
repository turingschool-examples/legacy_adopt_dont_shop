require 'rails_helper'

# Applications can be "In Progress", "Pending", "Accepted", or "Rejected"
RSpec.describe 'As a user' do
  describe "the Application show page" do
    it "should display details about application" do
      @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
      @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
      @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
      @application = Application.create!(name: 'Billy Bob', 
                                        address: '123 W Street, Denver, CO 80246',
                                        description: "I love animals.",
                                        status: "Pending"
                                        )
    PetApplication.create!(application: @application, pet: @pet1)
    PetApplication.create!(application: @application, pet: @pet3)

      # @application2 = Application.create!(name: 'James Malone', 
      #   address: '2630 W 23rd St, Denver, CO 80211',
      #   description: "I already have a dog, so they won't get lonely!",
      #   status: "Pending"
      #   )

      # @pet_app2 = PetApplication.create!(application: @application1, pet: @pet2)

      # PetApplication.create!(application: @application2, pet: @pet1)
      # PetApplication.create!(application: @application2, pet: @pet3)

      visit "/applications/#{@application.id}"

      expect(page).to have_content(@application.name)
      expect(page).to have_content(@application.address)
      expect(page).to have_content(@application.description)
      expect(page).to have_content(@application.status)
      expect(page).to have_link(@pet1.name, href: "/pets/#{@pet1.id}")
      expect(page).to have_link(@pet3.name, href: "/pets/#{@pet3.id}")
      expect(page).not_to have_link(@pet2.name, href: "/pets/#{@pet2.id}")

    end
  end
end