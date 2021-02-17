require 'rails_helper'

RSpec.describe 'When I visit an admin application show page' do
  before :each do
    @dominic = Application.create!(name: "Dominic", street: "2298 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 cats", application_status: "Pending" )
    @jordan = Application.create!(name: "Jordan", street: "2300 West 28th Ave", city: "Denver", state: "Colorado", zip_code: 80211, description:"Own 10 dogs", application_status: "Approved" )
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    ApplicationPet.create!(application: @dominic, pet: @pet1)
    ApplicationPet.create!(application: @dominic, pet: @pet2)
    ApplicationPet.create!(application: @dominic, pet: @pet3)
    ApplicationPet.create!(application: @jordan, pet: @pet1)
  end

  #story test 11
  describe "When I'm on the admin applications show page" do
    describe "I see a button to approve all specific pets" do
      it "and when I click that button I'm returned without the button" do
        visit "admin/applications/#{@dominic.id}"
           within("#admin-pet-#{@pet1.id}") do
            expect(page).to have_content(@pet1.name)
            expect(page).to have_button("Approve Application")
        end
      end
    end
  end

  #story test 12
  describe "When 1 pet is approved 1 waiting" do
    it "shows a button to approve and reject applications" do
      visit "admin/applications/#{@dominic.id}"
        within("#admin-pet-#{@pet1.id}") do
      expect(page).to have_content(@pet1.name)
      click_button "Reject Application"
      expect(page).not_to have_button("Approve Application")
      expect(page).not_to have_button("Reject Application")
      end
    end
  end
end
