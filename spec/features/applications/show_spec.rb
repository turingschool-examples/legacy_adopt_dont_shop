require 'rails-helper'

Rspec.describe "the Application index page" do
    it "should display Applicant info" do
         shelter1 = FactoryBot.create(:shelter)
         pet1 = FactoryBot.create(:pet, shelter: shelter1)
         pet2 = FactoryBot.create(:pet, shelter: shelter1)
         applicant1 = FactoryBot.create(:applicant)

         visit "/applicants/#{applicant1.id}"

         expect(page).to have_content(applicant1.address)
         expect(page).to have_content(applicant1.address)

