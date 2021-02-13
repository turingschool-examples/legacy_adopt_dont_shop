require 'rails_helper'

describe ApplicationPet, type: :model do
  describe "application pets" do
    it { should belong_to :application }
    it { should belong_to :pet }
  end
end
