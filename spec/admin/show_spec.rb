require 'rails_helper'

RSpec.describe "the admin/application show page" do
    before :each do
        @shelter1 = FactoryBot.create(:shelter)
        @pet1 = FactoryBot.create(:pet, shelter: @shelter1)
        @pet2 = FactoryBot.create(:pet, shelter: @shelter1)
        @applicant1 = FactoryBot.create(:applicant)
        @application1 = FactoryBot.create(:application, applicant: @applicant1)

        Adoption.create!(pet: @pet1, application: @application1)
        Adoption.create!(pet: @pet2, application: @application1)
      end

      

    
