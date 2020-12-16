require 'rails_helper'

RSpec.describe "the Application index page" do
    before :each do
        @shelter1 = FactoryBot.create(:shelter)
        @pet1 = FactoryBot.create(:pet, shelter: @shelter1)
        @pet2 = FactoryBot.create(:pet, shelter: @shelter1)
        @applicant1 = FactoryBot.create(:applicant)
        @application1 = FactoryBot.create(:application, applicant: @applicant1)

        Adoption.create!(pet: @pet1, application: @application1)
        Adoption.create!(pet: @pet2, application: @application1)
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

    it "should allow you to search for and click on a pet" do 
      visit "/applications/#{@applicant1.id}"

      expect(page).to have_button('Search')
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet2.name)

      fill_in 'Search', with @pet1.name
      click_on 'Search'

      expect(page).to have_content(@pet1.name)
      expect(page).to not_have_content(@pet2.name)

      click_on "#{@pet1.name}"

      expect(current_path).to eq("/pets/#{@pet1.id}")

    end

    it "should allow you to adopt a pet" do
      visit "/applications/#{@applicant1.id}"

      within("#playlist-#{@pet1.id}") do
        expect(page).to have_button('Adopt Me!')
        expect(page).to have_content(@pet1.name)
      end

      within("#playlist-#{@pet1.id}") do
        click_button 'Adopt Me!'
      end

      expect(page).to have_content("Pets")

    end
end

