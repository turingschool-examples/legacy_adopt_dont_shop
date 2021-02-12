require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a 'applications/new" do
    it "And I fail to fill in any of the form fields" do
      before(:each) do
        @application = Factory(:application)
        @application_2 = Factory(:application)
        @pet_1 = Factory(:pet)
        @pet_2 = Factory(:pet)
        @pet_3 = Factory(:pet)
        @pet_4 = Factory(:pet)
      end

      visit "/applications/new"

      fill_in "application[name]", :with => "Shrewsbury Heights"
      fill_in "application[address", :with => "6"
      fill_in "application[description]", :with => "54"
      click_button("Submit")
      expect(current_path).to eq("/applications/new")
    end

    it "And I see a message that I must fill in those fields" do
      visit "/applications/new"

      fill_in "application[name]", :with => "Shrewsbury Heights"
      fill_in "application[address", :with => "6"
      fill_in "application[description]", :with => "54"
      click_button("Submit")
      expect(current_path).to eq("/applications/new")
      expect(page).to have_content("must include pets")
      expect(page).to have_content("must include valid address")
      expect(page).to have_content("description must be at least 1050 characters")
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
