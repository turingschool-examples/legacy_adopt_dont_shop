require "rails_helper"

describe "As a visitor" do
  describe "When i visit the application page" do
    before :each do
      @shelter_1 = Shelter.create!(name: "Boulder Humane Society",
                                   address: "1234 Wallabe Way",
                                   city: "Boulder",
                                   state: "CO",
                                   zip: 80302)

      @pet1 = @shelter_1.pets.create!(name: "Rex",
                                      sex: 1,
                                      adoptable: true,
                                      approximate_age: 2,
                                      description: "likes walks",
                                      image: "image_1.png")

      @pet2 = @shelter_1.pets.create!(name: "Hedi",
                                      sex: 0,
                                      adoptable: true,
                                      approximate_age: 3,
                                      description: "likes barking",
                                      image: "image_2.png")

      @pet4 = @shelter_1.pets.create!(name: "Hedo",
                                      sex: 0,
                                      adoptable: true,
                                      approximate_age: 3,
                                      description: "likes barking",
                                      image: "image_2.png")

      @pet3 = @shelter_1.pets.create!(name: "Bork",
                                      sex: 0,
                                      adoptable: true,
                                      approximate_age: 3,
                                      description: "likes barking",
                                      image: "image_2.png")

      @bobby = Application.create!(name: "Bobby",
                                   street: "756 6th st.",
                                   city: "Boulder",
                                   state: "CO",
                                   zip_code: 80302,
                                   application_status: "In Progress",
                                   description: "I want these animals")
    end

    it 'I see can add a pet to my application' do
      visit application_path(@bobby)

      expect(page).to have_content("Add a pet to this application")

      fill_in "pet_search" , with: "Hedi"

      click_on "Search by Pet Name"

      expect(page).to have_link("Hedi - Adopt me")

      click_on "Hedi - Adopt me"

      expect(current_path).to eq(application_path(@bobby))

      within("#pets-applied-for-#{@bobby.id}") do
        within("#pet-id-#{@pet2.id}") do
          expect(page).to have_content(@pet2.name)
          expect(page).to_not have_content(@pet4.name)
        end
      end
    end
  end
end
