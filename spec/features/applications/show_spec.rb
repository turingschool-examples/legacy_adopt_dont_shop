require "rails_helper"

RSpec.describe "the Application show page" do
  it "displays all the information of the specific application" do
    shelter = create(:shelter)
    pet_1 = shelter.pets.create!(name: 'Kiko',
                                 approximate_age: 10,
                                 description: "Happy pup",
                                 sex: 1)
    pet_2 = shelter.pets.create!(name: 'Nikita',
                                 approximate_age: 2,
                                 description: "Very happy pup",
                                 sex: 0)
   application = create(:application, :pending)
   application.pets << [pet_1, pet_2]

    visit "/applications/#{application.id}"

    expect(page).to have_content(application.first_name)
    expect(page).to have_content(application.last_name)
    expect(page).to have_content(application.address)
    expect(page).to have_content(application.city)
    expect(page).to have_content(application.state)
    expect(page).to have_content(application.zip)
    expect(page).to have_content(application.application_status)
    expect(page).to have_link(pet_1.name, href: "/pets/#{pet_1.id}")
    expect(page).to have_link(pet_2.name, href: "/pets/#{pet_2.id}")
    expect(page).to have_content(application.case_for_adoption)
  end
end
