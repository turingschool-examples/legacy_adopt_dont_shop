require 'rails_helper'

describe Application, type: :model do
  describe 'validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
    it {should validate_numericality_of(:zipcode).is_greater_than_or_equal_to(0)}

    it 'status can be in_progress' do
      application = Application.create!(first_name: 'Jenny', last_name: 'Branham',
                                        address: '123 Adoption Ln.', city: 'Denver',
                                        state: 'CO', zipcode: '80222',
                                        description: 'description of application', status: 'in_progress')
      expect(application.status).to eq('in_progress')
      expect(application.in_progress?).to eq(true)
      expect(application.pending?).to eq(false)
      expect(application.accepted?).to eq(false)
      expect(application.rejected?).to eq(false)
    end

    it 'status can be pending' do
      application = Application.create!(first_name: 'Jenny', last_name: 'Branham',
                                        address: '123 Adoption Ln.', city: 'Denver',
                                        state: 'CO', zipcode: '80222',
                                        description: 'description of application', status: 'pending')
      expect(application.status).to eq('pending')
      expect(application.in_progress?).to eq(false)
      expect(application.pending?).to eq(true)
      expect(application.accepted?).to eq(false)
      expect(application.rejected?).to eq(false)
    end

    it 'status can be accepted' do
      application = Application.create!(first_name: 'Jenny', last_name: 'Branham',
                                        address: '123 Adoption Ln.', city: 'Denver',
                                        state: 'CO', zipcode: '80222',
                                        description: 'description of application', status: 'accepted')
      expect(application.status).to eq('accepted')
      expect(application.in_progress?).to eq(false)
      expect(application.pending?).to eq(false)
      expect(application.accepted?).to eq(true)
      expect(application.rejected?).to eq(false)
    end

    it 'status can be rejected' do
      application = Application.create!(first_name: 'Jenny', last_name: 'Branham',
                                        address: '123 Adoption Ln.', city: 'Denver',
                                        state: 'CO', zipcode: '80222',
                                        description: 'description of application', status: 'rejected')
      expect(application.status).to eq('rejected')
      expect(application.in_progress?).to eq(false)
      expect(application.pending?).to eq(false)
      expect(application.accepted?).to eq(false)
      expect(application.rejected?).to eq(true)
    end
  end
end
