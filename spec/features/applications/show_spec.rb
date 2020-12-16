require 'rails_helper'

RSpec.describe "the Application index page" do
    before :each do
        @shelter1 = FactoryBot.create(:shelter)
        @pet1 = FactoryBot.create(:pet, shelter: @shelter1)
        @pet2 = FactoryBot.create(:pet, shelter: @shelter1)
        @applicant1 = FactoryBot.create(:applicant)
        @application1 = FactoryBot.create(:application, applicant: @applicant1)

        ApplicationPet.create!(pet: @pet1, application: @application1)
        ApplicationPet.create!(pet: @pet2, application: @application1)
      end
    
    it "should display Application info" do
         visit "/applications/#{@applicant1.id}"

         expect(page).to have_content(@applicant1.name)
         expect(page).to have_content(@applicant1.address)
         expect(page).to have_content(@applicant1.address)
         expect(page).to have_content(@applicant1.city)
         expect(page).to have_content(@application1.description)
         expect(page).to have_content(@application1.status)
         expect(page).to have_content(@pet2.name)
    end

    it "should allow you to search for and add a pet" do 
      visit "/applications/#{@applicant1.id}"

      expect(page).to have_button('Search')


end

