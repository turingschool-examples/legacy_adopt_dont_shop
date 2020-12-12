require 'rails_helper'

describe Applicant, type: :model do
  describe "relationships" do
    it {should have_many :applications}
  end
end
