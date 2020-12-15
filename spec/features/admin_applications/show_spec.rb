require "rails_helper"

describe "admin application show page" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)

    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter1.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")

    @application1 = Application.create(applicant: "John Doe", description: "I love dogs!!!", address: "Somewhere")
    @application2 = Application.create(applicant: "Jane Doe", description: "I love dogs more than John", address: "Somewhere")

    ApplicationPet.create(application: @application1, pet: @pet1)
    ApplicationPet.create(application: @application1, pet: @pet2)

    ApplicationPet.create(application: @application2, pet: @pet3)
    ApplicationPet.create(application: @application2, pet: @pet2)
    visit "/admin/applications/#{@application1.id}"
  end

  it "has a button to approve or reject pets" do
    expect(page).to have_button("Approve")
    expect(page).to have_button("Reject")
  end
end
