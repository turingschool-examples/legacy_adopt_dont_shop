require 'rails_helper'

RSpec.describe 'When I visit an application show page' do 
  before :each do 
    @application1 = Application.create!(name: "Jake", street: "123 Main St", city: "Denver", state: "CO", zip: "80210", description: "I love animals", status: "In Progress")
    @application2 = Application.create!(name: "Bri", street: "456 Adams St", city: "Boulder", state: "CO", zip: "80235", description: "Cats rule", status: "In Progress")
    @shelter1 = Shelter.create!(name: "Homeless Pets", address: "42 Wallaby Ln", city: "Melbourne", state: "Arizona", zip: "64875")
    @pet1 = @shelter1.pets.create!(image: "https://tinyurl.com/1lfqkx90", name: "Dwade", approximate_age: 6, description: "mean animal", sex: 1)
    @pet2 = @shelter1.pets.create!(image: "https://tinyurl.com/1lfqkx90", name: "cuatro", approximate_age: 9, description: "good cat", sex: 1)
    @pet3 = @shelter1.pets.create!(image: "https://tinyurl.com/1lfqkx90", name: "callie", approximate_age: 10, description: "sweet momma kitty", sex: 0)
  end
  describe 'before an application has been submitted' do 
    it 'has a section Add a Pet To this Application that returns pets' do 
      
      visit "/applications/#{@application1.id}"

      fill_in "pet_name", with: "c"

      click_button 'Submit'
      
      expect(current_path).to eq("/applications/#{@application1.id}")
      expect(page).to have_content("cuatro")
      expect(page).to have_content("callie")
      # save_and_open_page
    end
  end
  describe 'before an application has been submitted' do 
    it 'has a section that DOESNT returns pets bc none are found' do
      visit "/applications/#{@application1.id}"

      fill_in "pet_name", with: "z"

      click_button 'Submit'
      
      expect(current_path).to eq("/applications/#{@application1.id}")
      expect(page).to have_no_content("cuatro")
      expect(page).to have_no_content("callie")
      save_and_open_page
    end
  end
end