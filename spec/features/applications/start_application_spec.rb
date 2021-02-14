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
      click_button("Start an Application")


      expect(current_path).to eq("/applications/new")
      fill_in "application[name]", :with => "Shrewsbury Heights"
      fill_in "application[address]", :with => "123 fake st."
      fill_in "application[description]", :with => "I'd be a good dog dad because i love dogs!!"
      click_button("Submit")
    end

    it "And I see a message that I must fill in name" do

      visit "/applications/new"
      save_and_open_page
      fill_in "application[address]", :with => "123 fake st"
      fill_in "application[description]", :with => "I'd be a good dog dad because i love dogs!!"
      find_field('submit', type: :hidden)
      click_link("Submit")
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("must include name")

    end

    it "And I see a message that I must fill in address" do
      visit "/applications/new"

      fill_in "application[name]", :with => "Shrewsbury Heights"
      fill_in "application[description]", :with => "I'd be a good dog dad because i love dogs!!"
      find_field('submit', type: :hidden)
      click_button("Submit")
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("must include valid address")
    end

    it "And I see a message that I must fill in description" do
      visit "/applications/new"

      fill_in "application[name]", :with => "Shrewsbury Heights"
      fill_in "application[address]", :with => "123 fake st"
      find_field('submit', type: :hidden)
      click_button("Submit")
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("description must be at least 255 characters")
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
