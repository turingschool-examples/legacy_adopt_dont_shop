require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the show page' do
    before :each do
      application_1 = create(:application)
      application_2 = create(:application)
      application_3 = create(:application)
      shelter_1 = create(:shelter)
      shelter_2 = create(:shelter)
      shelter_3 = create(:shelter)
      pet_1 = create(:pet, :shelter: shelter_1)
      pet_2 = create(:pet, :shelter: shelter_2)
      pet_3 = create(:pet, :shelter: shelter_3)
    end
    it '' do
      
    end
  end
end
