require 'rails_helper'

RSpec.describe 'Admin application show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter",
                                address: "123 Shady Ave",
                                city: "Denver",
                                state: "CO",
                                zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"",
                                   name: "Thor",
                                   description: "dog",
                                   approximate_age: 2,
                                   sex: "male")
    @pet2 = @shelter1.pets.create!(image:"",
                                   name: "Athena",
                                   description: "cat",
                                   approximate_age: 3,
                                   sex: "female")
    @application_1 = Application.create!(name: "Sally",
                                         address: "234 Third Ave",
                                         city: "Dallas",
                                         state: "TX",
                                         zip: 88678,
                                         status: "In Progress")
    @application_2 = Application.create!(name: "Joe",
                                         address: "234 Third Ave",
                                         city: "Dallas",
                                         state: "TX",
                                         zip: 88678,
                                         status: "In Progress")
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet1.id)
    PetApplication.create!(application_id: @application_1.id, pet_id: @pet2.id)
  end

  it 'can approve application' do
    visit "/admin/applications/#{@application_1.id}"

    within("#pet-#{@pet1.id}") do
      expect(page).to have_button('Approve Application')
      click_on('Approve Application')
    end

    expect(current_path).to eq("/admin/applications/#{@application_1.id}")

    within("#pet-#{@pet1.id}") do
      expect(page).to_not have_button('Approve Application')
      expect(page).to have_content("Approved")
    end
  end
end
