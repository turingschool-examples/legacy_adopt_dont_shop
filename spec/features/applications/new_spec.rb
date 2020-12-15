require 'rails_helper'

RSpec.describe 'New Application' do
    before :each do
        @shelter1 = FactoryBot.create(:shelter)
        @pet1 = FactoryBot.create(:pet, shelter: @shelter1)
        @pet2 = FactoryBot.create(:pet, shelter: @shelter1)
        @applicant1 = FactoryBot.create(:applicant)
        @application1 = FactoryBot.create(:application, applicant: @applicant1)
      end
    
    describe 'As a visitor' do
        describe 'When I visit the new application form by clicking a link on the pets index' do
            it "I can start a new application" do
                visit "/pets"
                save_and_open_page
                click_link 'Start an Application'
                
                expect(current_path).to eq('/applications/new')

                fill_in 'Name', with: "#{applicant1.name}"
                fill_in 'Street Address', with: "#{applicant1.address}"
                fill_in 'City', with: "#{applicant1.city}"
                fill_in 'State', with: "#{applicant1.state}"
                fill_in 'Zip Code', with: "#{applicant1.zip}"
                click_on 'Submit'

                expect(current_path).to eq("/applications/#{@application.id}")
                expect(page).to have_content("#{applicant1.name}")
                expect(page).to have_content("#{applicant1.address}")
                expect(page).to have_content("#{applicant1.city}")
                expect(page).to have_content("#{applicant1.state}")
                expect(page).to have_content("#{applicant1.zip}")
                expect(page).to have_content('In Progress')
            end
        end
    end
end 