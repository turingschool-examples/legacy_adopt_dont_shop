require 'rails_helper'

describe ApplicationPet, type: :model do
  describe "applications" do
    it { should belong_to :application }
    it { should belong_to :song }
  end
end 
