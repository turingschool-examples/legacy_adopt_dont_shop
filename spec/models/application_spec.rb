require 'rails_helper'

RSpec.describe Application do
	before :each do
  	@application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
  end

  describe 'relationships' do
		it { should have_many :pet_applications}

		it {should have_many(:pets).through(:pet_applications)}
  end
	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :street }
		it { should validate_presence_of :city }
		it { should validate_presence_of :state }
		it { should validate_presence_of :zip }
	end

	describe 'class methods' do

	end

	describe 'instance methods' do

		it'#get_full_address'do
			expect(@application_1.get_full_address).to eq("123 street,Denver,CO,80220")
		end
		
	end


end