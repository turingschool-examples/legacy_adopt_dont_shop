require 'rails_helper'

RSpec.describe "Application show page", type: :feature do
  before :each do
    Application.destroy_all

    @application1 = Application.create!(name: "Peter Smith", address: "123 Main Ave", city: "Denver", state: "CO", zip: 80011, description: "Love pets")
  end
  describe "as a Visitor" do
    describe "when I visit the show page for specific application" do
      it "displays all the applicant attributes" do
        visit "/applications/#{@application1.id}"

        expect(page).to have_content(@application1.name)
        expect(page).to have_content(@application1.address)
        expect(page).to have_content(@application1.city)
        expect(page).to have_content(@application1.state)
        expect(page).to have_content(@application1.zip)
        expect(page).to have_content(@application1.description)
        expect(page).to have_content(@application1.status)
      end
    end
  end
end