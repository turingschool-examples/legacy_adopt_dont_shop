require 'rails_helper'

RSpec.describe PetApplication do
  describe "relationships" do
    it {should belong_to :pet}
    it {should belong_to :application}
  end

  describe "validations" do
    it {is_expected.to validate_presence_of(:pet_id)}
    it {is_expected.to validate_presence_of(:application_id)}
  end
end