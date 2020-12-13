require 'rails-helper'

Rspec.describe "the Application index page" do
    it "should display Application info" do
         shelter1 = FactoryBot.create(:shelter)
         pet1 = FactoryBot.create(:pet, shelter: shelter1)
         pet2 = FactoryBot.create(:pet, shelter: shelter1)
         applicant1 = FactoryBot.create(:applicant)
         application1 = FactoryBot.create(:application, applicant: applicant1)

         ApplicationPet.create!(pet: pet1, application: application1)
         ApplicationPet.create!(pet: pet2, application: application1)

         visit "/applicants/#{applicant1.id}"

         expect(page).to have_content(applicant1.name)
         expect(page).to have_content(applicant1.address)
         expect(page).to have_content(applicant1.address)
         expect(page).to have_content(applicant1.city)
         expect(page).to have_content(applicant1.zip)
         expect(page).to have_content(application1.description)
         expect(page).to have_content(application1.status)
         expect(page).to have_content(pet1.name)
         expect(page).to have_content(pet2.name)
    end
end

