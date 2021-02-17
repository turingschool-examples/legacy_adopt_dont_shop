require "rails_helper"

RSpec.describe "the Application show page" do
  before :each do
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

  it "displays all the information of the specific application" do
    visit "/applications/#{@application.id}"

    expect(page).to have_content(@application.first_name)
    expect(page).to have_content(@application.last_name)
    expect(page).to have_content(@application.address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip)
    expect(page).to have_content(@application.application_status)
    expect(page).to have_link(@pet_1.name, href: "/pets/#{@pet_1.id}")
    expect(page).to have_link(@pet_2.name, href: "/pets/#{@pet_2.id}")
    expect(page).to have_content(@application.case_for_adoption)
  end

  it "can search for pets for an application" do
    visit "/applications/#{@application.id}"

    expect(page).to have_content("In Progress")

    within("#application-#{@application.id}") do
      expect(page).to have_content("Add a Pet to this Application")
      expect(page).to have_css("input#pet_name")
      fill_in("pet_name", with: @pet_3.name)
    end

    click_button("Search")

    expect(current_path).to eq("/applications/#{@application.id}")
    expect(page).to have_content(@pet_3.name)
    expect(page).to_not have_content(@pet_4.name)
  end

  it "adds a pet to an application" do
    visit "/applications/#{@application.id}"

    expect(page).to have_css("input#pet_name")

    fill_in("pet_name", with: @pet_3.name)

    click_button("Search")

    expect(page).to have_content(@pet_3.name)
    expect(page).to have_button("Adopt this Pet")

    click_button("Adopt this Pet")

    expect(current_path).to eq("/applications/#{@application.id}")
    expect(page).to have_content(@pet_3.name)
  end

  it "can submit an application" do
    visit "/applications/#{@application.id}"

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)

    within("#submit") do
      expect(page).to have_content("Why I would make a good owner for these pet(s)")

      fill_in("case_for_adoption", with: :case_for_adoption)

      click_button("Submit", match: :first)
    end

    expect(current_path).to eq("/applications/#{@application.id}")
    expect(page).to have_content("Pending")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
    expect(page).to_not have_content(@pet_3.name)
    expect(page).to_not have_content("Add a Pet to this Application")
  end

  it "cannot submit an application with no pets added to the application" do
    @application.pets.destroy_all
    visit "/applications/#{@application.id}"


    expect(page).to_not have_content("Why I would make a good owner for these pet(s)")
    expect(page).to_not have_button("Submit")
    expect(page).to have_content("In Progress")
  end

  it "can see any pet whose name partially matches a search" do
    @application.pets << [@pet_3, @pet_4]

    visit "/applications/#{@application.id}"

    within("#application-#{@application.id}") do
      expect(page).to have_content("Add a Pet to this Application")
      expect(page).to have_css("input#pet_name")
      fill_in("pet_name", with: "Kas")
      click_button("Search")
    end

    expect(page).to have_content(@pet_3.name)
  end

  it "can check that a search is case insensitive" do
    @application.pets << [@pet_3, @pet_4]

    visit "/applications/#{@application.id}"

    within("#application-#{@application.id}") do
      expect(page).to have_content("Add a Pet to this Application")
      fill_in("pet_name", with: "BELLA")
      click_button("Search")
    end
    expect(page).to have_content("Bella")
  end
end
