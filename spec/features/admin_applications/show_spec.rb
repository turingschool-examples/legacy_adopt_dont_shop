require "rails_helper"

RSpec.describe "Admin Application Show Page" do
  before :each do
    PetApplication.destroy_all
    Pet.destroy_all
    Shelter.destroy_all
    Application.destroy_all

    @shelter = create(:shelter)
    @pet_1 = @shelter.pets.create!(name: 'Kiko',
                                 approximate_age: 10,
                                 description: "Happy pup",
                                 sex: 1)
    @pet_2 = @shelter.pets.create!(name: 'Nikita',
                                 approximate_age: 2,
                                 description: "Very happy pup",
                                 sex: 0)
    @pet_3 = @shelter.pets.create!(name: 'Kasha',
                                 approximate_age: 4,
                                 description: "Very happy pup",
                                 sex: 0)
    @pet_4 = @shelter.pets.create!(name: 'Bella',
                                 approximate_age: 5,
                                 description: "Very happy pup",
                                 sex: 0)
    @application = create(:application)
    @application.pets << [@pet_1, @pet_2]
  end

  it "can approve a pet for adoption" do
    visit "/admin/applications/#{@application.id}"

    within "#pet-#{@pet_1.id}" do
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_button("Approve")

      click_button("Approve")

      expect(current_path).to eq("/admin/applications/#{@application.id}")
      expect(page).to_not have_button("Approve")
      expect(page).to have_content("Pet Approved")
    end

    within "#pet-#{@pet_2.id}" do
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_button("Approve")
      click_button("Approve")

      expect(current_path).to eq("/admin/applications/#{@application.id}")
      expect(page).to_not have_button("Approve")
      expect(page).to have_content("Pet Approved")
    end
  end
end
