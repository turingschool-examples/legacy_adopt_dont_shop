require 'rails_helper' 

RSpec.describe Application, type: :model do 
  before :each do 
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Homeless Animals", address: "789 Silly Ave", city: "Longmont", state: "AZ", zip: 78495)
    @shelter3 = Shelter.create!(name: "Pet Paradise", address: "954 Shelter Dr.", city: "Commerce City", state: "NM", zip: 24897)

    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet4 = @shelter1.pets.create!(image:"", name: "Cuatro", description: "cat", approximate_age: 7, sex: "male")
    @pet5 = @shelter3.pets.create!(image:"", name: "Callie", description: "cat", approximate_age: 10, sex: "female")
    @pet6 = @shelter3.pets.create!(image:"", name: "Anna", description: "dog", approximate_age: 5, sex: "female")
    
    @application1 = Application.create!(name: "Jake", street: "123 Main St", city: "Denver", state: "CO", zip: "80210", description: "I love animals", status: "In Progress")
    @application2 = Application.create!(name: "Bri", street: "456 Adams St", city: "Boulder", state: "CO", zip: "80235", description: "Cats rule", status: "In Progress")

    @PetApp1 = PetApplication.create!(pet_id: @pet1.id, application_id: @application1.id)
    @PetApp2 = PetApplication.create!(pet_id: @pet2.id, application_id: @application1.id)
    @PetApp3 = PetApplication.create!(pet_id: @pet5.id, application_id: @application1.id)
    @PetApp4 = PetApplication.create!(pet_id: @pet1.id, application_id: @application2.id)
    @PetApp5 = PetApplication.create!(pet_id: @pet3.id, application_id: @application2.id)
    @PetApp6 = PetApplication.create!(pet_id: @pet4.id, application_id: @application2.id)
end
  describe "relationships" do
    it {should have_many :pet_applications}
    it {should have_many(:pets).through(:pet_applications)}
  end

  describe 'instance methods' do 
    describe '#match_pets' do 
      it 'returns pets that match case insensitive and substring' do 
        expect(@application1.match_pets("t")).to eq([@pet1, @pet2, @pet4])
      end
    end
    describe '#pets_on_app' do 
      it "returns pet names on an application" do 
        expect(@application2.pets_on_app(@application2.id)).to eq ([@pet1, @pet3, @pet4])
      end
    end
    describe "#change_pet_status" do 
      it 'changes pet status to Approved on a pet application record' do 
        expect(@application1.change_pet_status("Approve", @pet1.id, @application1.id)).to eq (true)
      end
    end
    describe "#change_pet_status" do 
      it 'changes pet status to Rejected on a pet application record' do 
        expect(@application1.change_pet_status("Reject", @pet1.id, @application1.id)).to eq (true)
      end
    end
    describe "#change_status" do 
      it "should change the application status to Approved if all pets have been approved" do 
        @PetApp1.update!(status: "Approved")
        @PetApp2.update!(status: "Approved")
        @PetApp3.update!(status: "Approved")
        expect(@application1.change_status(@application1.id)).to eq (true)
        @application1.change_status(@application1.id)
        expect(Application.find(@application1.id).status).to eq ("Approved")
      end
      it "should change the application status to Rejected if all pets have been decided and at least one is rejected" do 
        @PetApp1.update!(status: "Approved")
        @PetApp2.update!(status: "Approved")
        @PetApp3.update!(status: "Rejected")
        expect(@application1.change_status(@application1.id)).to eq (true)
        @application1.change_status(@application1.id)
        expect(Application.find(@application1.id).status).to eq ("Rejected")
      end
    end
  end
end