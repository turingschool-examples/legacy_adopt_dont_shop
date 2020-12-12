require "rails_helper"

describe "As a visitor" do
  describe "When i visit an applications show page" do
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
      
      ApplicationPet.create!(application: @bobby, pet: @pet3)
      ApplicationPet.create!(application: @bobby, pet: @pet2)
    end

    it "I see the attributes of the specific application" do
      visit application_path(@bobby)

      expect(page).to have_content("Name: #{@bobby.name}")
      expect(page).to have_content("Street: #{@bobby.street}")
      expect(page).to have_content("City: #{@bobby.city}")
      expect(page).to have_content("State: #{@bobby.state}")
      expect(page).to have_content("Zip-code: #{@bobby.zip_code}")
      expect(page).to have_content("Application Status: #{@bobby.application_status}")
      expect(page).to_not have_content("Description: #{@bobby.description}")

      expect(page).to have_content("Pets applied for:")
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet3.name)
    end
  end
end
