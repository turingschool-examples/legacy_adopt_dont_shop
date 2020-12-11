require "rails_helper"

describe ApplicationPet, type: :model do
  describe "relationships" do
    it { should belong_to :pet }
    it { should belong_to :application }
  end

  describe "validations" do
  end

  describe "instance methods" do
  end
end
