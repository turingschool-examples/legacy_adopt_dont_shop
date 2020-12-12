require "rails_helper"

describe Application, type: :model do
  describe "relationships" do
    it { should have_many :application_pets }
    it { should have_many(:pets).through(:application_pets) }
  end

  describe "validations" do
    it {validate_presence_of :name}
    it {validate_presence_of :street}
    it {validate_presence_of :city}
    it {validate_presence_of :state}
    it {validate_presence_of :zip_code}
  end

  describe "instance methods" do
  end
end
