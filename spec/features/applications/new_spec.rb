require 'rails_helper'

RSpec.describe "the Application's New page" do
  describe "As a Visitor on the pet index page" do
    describe "I click a link 'Start an Application' takes me to new application page" do
      it "I can start a new application" do
        visit "/pets"
        click_link "Start an Application"
        expect(current_path).to eq("/applications/new")
      end
    end
  end
end