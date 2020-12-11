require 'rails_helper'

RSpec.describe "New Application Page" do
  it 'has a form for creating a new application' do
    visit applications_new_path

    expect(page).to have_selector('form')
    expect(page).to have_field(:applicant_name)
    expect(page).to have_field(:applicant_address)
    expect(page).to have_field(:applicant_city)
    expect(page).to have_field(:applicant_state)
    expect(page).to have_field(:applicant_zip)
    expect(page).to have_field(:home_description)
    expect(page).to have_button("Submit")
  end

  it 'navigates to the new applications show page on submit' do
    visit applications_new_path

    fill_in(:applicant_name)
    fill_in(:applicant_address)
    fill_in(:applicant_city)
    fill_in(:applicant_state)
    fill_in(:applicant_zip)
    fill_in(:home_description)
    click_button("Submit")

    application = Application.first
    expect(page).to have_current_path("/applications/#{application.id}")
    expect(page).to have_content(application.applicant_name)
    expect(page).to have_content(application.applicant_address)
    expect(page).to have_content(application.applicant_city)
    expect(page).to have_content(application.applicant_state)
    expect(page).to have_content(application.applicant_zip)
    expect(page).to have_content(application.home_description)
    expect(page).to have_content("In Progress")
  end

  describe "visitors cannot submit incomplete applications" do
    it 'name is required' do
      visit applications_new_path

      fill_in(:applicant_address)
      fill_in(:applicant_city)
      fill_in(:applicant_state)
      fill_in(:applicant_zip)
      fill_in(:home_description)
      click_button("Submit")

      expect(page).to have_current_path(applications_new_path)
      expect(page).to have_content("Name is a required field")
    end

    it 'address is required' do
      visit applications_new_path

      fill_in(:applicant_name)
      fill_in(:applicant_city)
      fill_in(:applicant_state)
      fill_in(:applicant_zip)
      fill_in(:home_description)
      click_button("Submit")

      expect(page).to have_current_path(applications_new_path)
      expect(page).to have_content("Address is a required field")
    end

    it 'city is required' do
      visit applications_new_path

      fill_in(:applicant_name)
      fill_in(:applicant_city)
      fill_in(:applicant_state)
      fill_in(:applicant_zip)
      fill_in(:home_description)
      click_button("Submit")

      expect(page).to have_current_path(applications_new_path)
      expect(page).to have_content("City is a required field")
    end

    it 'state is required' do
      visit applications_new_path

      fill_in(:applicant_name)
      fill_in(:applicant_address)
      fill_in(:applicant_city)
      fill_in(:applicant_zip)
      fill_in(:home_description)
      click_button("Submit")

      expect(page).to have_current_path(applications_new_path)
      expect(page).to have_content("State is a required field")
    end

    it 'zip is required' do
      visit applications_new_path

      fill_in(:applicant_name)
      fill_in(:applicant_address)
      fill_in(:applicant_city)
      fill_in(:applicant_state)
      fill_in(:home_description)
      click_button("Submit")

      expect(page).to have_current_path(applications_new_path)
      expect(page).to have_content("Zip is a required field")
    end

    it 'home_description is required' do
      visit applications_new_path

      fill_in(:applicant_name)
      fill_in(:applicant_address)
      fill_in(:applicant_city)
      fill_in(:applicant_state)
      fill_in(:applicant_zip)
      click_button("Submit")

      expect(page).to have_current_path(applications_new_path)
      expect(page).to have_content("home is a required field")
    end
  end
end
