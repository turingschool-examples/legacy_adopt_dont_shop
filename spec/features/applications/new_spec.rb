require 'rails_helper'

RSpec.describe "the Application's New page" do
  describe "As a Visitor on the pet index page" do
    describe "I click a link 'Start an Application' takes me to new application page" do
      it "takes me to new application page" do
        visit "/pets"
        click_link "Start an Application"
        expect(current_path).to eq("/applications/new")
      end
      it "can create a new application" do
        visit "/applications/new"

        fill_in 'application[name]', with: "John"
        fill_in 'application[address]', with: "243 State St"
        fill_in 'application[city]', with: "Denver"
        fill_in 'application[state]', with: "CO"
        fill_in 'application[zip]', with: 34534
        fill_in 'application[description]', with: "Love pets"
        click_on 'Submit'

        #expect(current_path).to eq("/applications/:id")
        expect(page).to have_content("John")
        expect(page).to have_content("243 State St")
        expect(page).to have_content("Denver")
        expect(page).to have_content("CO")
        expect(page).to_not have_content("123 Main St")
      end
      it "can redirect to new page if form empty" do
        visit "/applications/new"

        click_on "Submit"
        expect(current_path).to eq("/applications")
      end
    end
  end
end