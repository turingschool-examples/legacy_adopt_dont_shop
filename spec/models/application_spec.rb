describe Application, type: :model do
  # describe 'validations' do
  #   it { should validate_presence_of :name }
  #   it { should validate_presence_of :street_address }
  #   it { should validate_presence_of :city }
  #   it { should validate_presence_of :state }
  #   it { should validate_presence_of :zip_code }
  #   it { should validate_presence_of :description_of_applicant }
  #   it { should validate_presence_of :pet_name }
  #   it { should validate_presence_of :application_status }
  #   it { should validate_presence_of :created_at }
  #   it { should validate_presence_of :updated_at }
  # end

  describe 'relationships' do
    it { should have_many(:pets).through(:application_pets) }
    # it { should have_many :pets }
    # it { is_expected_to.belong_to(:application_pets).optional }

  end
end
