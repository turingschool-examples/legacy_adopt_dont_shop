require 'rails_helper'

RSpec.describe "application show page" do
  describe "when I visit the application show page" do
    it "shows the application, name, address, description, list of pets, and status" do
      ### ALSO NEED TO ADD LIST OF PETS ###
      app = Application.create!(name: "name1", street: "123 abc st.", city: "city", state: "state", zip: "92018", description: "Some words", status: "Pending")

      visit "/applications/#{app.id}"

      expect(page).to have_content(app.name)
      expect(page).to have_content(app.street)
      expect(page).to have_content(app.city)
      expect(page).to have_content(app.state)
      expect(page).to have_content(app.zip)
      expect(page).to have_content(app.description)
      expect(page).to have_content(app.status)
    end
  end
end
