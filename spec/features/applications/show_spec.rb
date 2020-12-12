require 'rails_helper'

RSpec.describe "Application Show Page" do
  it 'displays applicant details' do
    application = create(:application)

    visit application_path(application)

    expect(page).to have_content(application.applicant_name)
    expect(page).to have_content(application.applicant_address)
    expect(page).to have_content(application.applicant_city)
    expect(page).to have_content(application.applicant_state)
    expect(page).to have_content(application.applicant_zip)
    expect(page).to have_content(application.home_description)
  end

  it 'displays the names of all pets with links to their show pages' do
    application = create(:application)
    pet_1 = create(:pet)
    pet_2 = create(:pet)

    ApplicationPet.create(application: application, pet: pet_1)
    ApplicationPet.create(application: application, pet: pet_2)

    visit application_path(application)

    expect(page).to have_link(pet_1.name)
    expect(page).to have_link(pet_2.name)
  end

  it 'displays the status of the application' do
    application = create(:application)

    visit application_path(application)

    expect(page).to have_content(application.status)
  end

  it 'has a section to add a pet to the application' do
    application = create(:application)

    visit application_path(application)

    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_field(:search)
  end

  it 'can search for pets by name' do
    application = create(:application)
    5.times {create(:pet)}

    visit application_path(application)

    pet = Pet.all.sample
    fill_in(:search, with: pet.name)
    click_button("Search")

    expect(current_path).to eq(application_path(application))
    within("#pet-#{pet.id}") do
      expect(page).to have_content(pet.name)
      expect(page).to have_button("Adopt this Pet")
    end
  end

  it 'returns partial matches for pet names' do
    application = create(:application)
    fluff = create(:pet, name: "FLUFF")
    fluffy = create(:pet, name: "Fluffy")
    mrfluff = create(:pet, name: "Mr. Fluff")
    spike = create(:pet, name: "Spike")

    visit application_path(application)

    fill_in(:search, with: "fluff")
    click_button("Search")

    expect(page).to have_content(fluff.name)
    expect(page).to have_content(fluffy.name)
    expect(page).to have_content(mrfluff.name)
    expect(page).not_to have_content(spike.name)
  end

  it 'can add a pet to an application' do
    application = create(:application)
    5.times {create(:pet)}

    visit application_path(application)

    pet = Pet.all.sample
    fill_in(:search, with: pet.name)
    click_button("Search")
    click_button("Adopt this Pet")

    expect(page).to have_current_path(application_path(application))
    within("#application_pets") do
      expect(page).to have_content(pet.name)
    end
  end

  it 'allows the application to be submitted if it has pets' do
    application = create(:application)

    visit application_path(application)

    expect(page).to have_button("Submit Application")

    pet = create(:pet)
    ApplicationPet.create(application, pet)
    refresh

    expect(page).to have_button("Submit Application")
    expect(page).to have_field(:owner_description)
  end

  it 'does not allow submitted applications to be changed' do
    application_1 = create(:application, status: "Pending")
    application_2 = create(:application, status: "Accepted")
    application_3 = create(:application, status: "Rejected")

    visit application_path(application_1)
    expect(page).not_to have_content("Add a Pet to this Application")
    expect(page).not_to have_button("Submit Application")

    visit application_path(application_2)
    expect(page).not_to have_content("Add a Pet to this Application")
    expect(page).not_to have_button("Submit Application")

    visit application_path(application_3)
    expect(page).not_to have_content("Add a Pet to this Application")
    expect(page).not_to have_button("Submit Application")
  end

  it 'changes the application status on submit' do
    application = create(:application)
    pet = create(:pet)
    ApplicationPet.create(application, pet)

    visit application_path(application)
    fill_in(:owner_description)
    click_button("Submit Application")

    expect(page).to have_current_path(application_path(application))
    expect(page).to have_content("Pending")
    expect(page).to have_content(pet.name)
    expect(page).not_to have_content("Add a Pet to this Application")
    expect(page).not_to have_button("Adopt this Pet")
  end
end
