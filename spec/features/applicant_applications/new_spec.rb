require 'rails_helper'

RSpec.describe 'From application index page, create new Application' do
    before :each do
        @shelter1 = FactoryBot.create(:shelter)
        @pet1 = FactoryBot.create(:pet, shelter: @shelter1)
        @pet2 = FactoryBot.create(:pet, shelter: @shelter1)
      end
    
    describe 'As a visitor' do
        describe 'When I visit the new application form by clicking a link on the pets index' do
            it "I can start a new application" do
                visit "/pets"

                click_link 'Start an Application'
                
                expect(current_path).to eq('/applications/new')

                fill_in 'Name', with: "Adam"
                fill_in 'Address', with: "123 cherry st"
                fill_in 'City', with: "Denver"
                fill_in 'State', with: "CO"
                fill_in 'Zip', with: "80205"
                click_on 'Submit'

                @application = Application.last 

                expect(current_path).to eq("/applications/#{@application.id}")
                expect(page).to have_content("Adam")
                expect(page).to have_content("123 cherry st")
                expect(page).to have_content("Denver")
                expect(page).to have_content("CO")
                expect(page).to have_content("80205")
                expect(page).to have_content('In Progress')
            end
        end
    end
end 