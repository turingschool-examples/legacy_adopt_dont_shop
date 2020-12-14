require 'rails_helper'

RSPec.describe 'New Application' do
    before :each do
        applicant1 = Applicant.create!(name: "Adam Cohen", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      end
    
    describe 'As a visitor' do
        describe 'When I visit the new application form by clicking a link on the pets index' do
            it "I can start a new application" do
                visit "/pets"
                
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