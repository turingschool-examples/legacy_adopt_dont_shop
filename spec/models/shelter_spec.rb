require 'rails_helper'

describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
  end

  describe "instance methods" do
    it "formatted_address" do
      shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      expect(shelter1.formatted_address).to eq("123 Shady Ave Denver, CO 80129")
    end
  end
end
