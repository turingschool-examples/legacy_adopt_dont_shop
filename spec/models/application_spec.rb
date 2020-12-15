require "rails_helper"

describe Application, type: :model do
  describe "relationships" do
    it {should have_many(:application_pets).dependent(:destroy)}
    it { should have_many(:pets).through(:application_pets) }
  end

  describe "validations" do
    it { validate_presence_of :name }
    it { validate_presence_of :street }
    it { validate_presence_of :city }
    it { validate_presence_of :state }
    it { validate_presence_of :zip_code }
    it { is_expected.to validate_presence_of(:description).on(:update) }
  end

  describe "class methods" do
  end
end
