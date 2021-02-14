require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'applications/new" do
    before(:each) do
      @application = create(:application)
      @application_2 = create(:application)
      @pet_1 = create(:pet)
      @pet_2 = create(:pet)
      @pet_3 = create(:pet)
      @pet_4 = create(:pet)
    end

    it "And I fail to fill in any of the form fields" do

      visit "/pets"
      click_link("Start an Application")


      expect(current_path).to eq("/applications/new")
      fill_in "name", :with => "Shrewsbury Heights"
      fill_in "address", :with => "123 fake st."
      fill_in "description", :with => "I'd be a good dog dad because i love dogs!!"
      click_button("Submit")
    end

    it "And I see a message that I must fill in name" do

      visit "/applications/new"
      fill_in "address", :with => "123 fake st"
      fill_in "description", :with => "I'd be a good dog dad because i love dogs!!"
      click_button("Submit")
      save_and_open_page
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("You're missing vital information!")

    end

    it "And I see a message that I must fill in address" do
      visit "/applications/new"

      fill_in "name", :with => "Shrewsbury Heights"
      fill_in "description", :with => "I'd be a good dog dad because i love dogs!!"
      click_button("Submit")
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("You're missing vital information!")
    end

    it "And I see a message that I must fill in description" do
      visit "/applications/new"

      fill_in "name", :with => "Shrewsbury Heights"
      fill_in "address", :with => "123 fake st"
      click_button("Submit")
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("You're missing vital information!")
    end
  end
end




# Starting an Application, Form not Completed
#
# As a visitor
# When I visit the new application page
# And I fail to fill in any of the form fields
# And I click submit
# Then I am taken back to the new applications page
# And I see a message that I must fill in those fields.
