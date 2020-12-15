require "rails_helper"
describe Application, type: :model do
  describe "relationships" do
    it {should have_many :application_pets}
    it {should have_many(:pets).through(:application_pets)}
  end

  describe "instance methods" do
    before :each do
      @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)

      @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter1.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
      @pet4 = @shelter1.pets.create!(image:"", name: "Zeus 2", description: "dog", approximate_age: 4, sex: "male")

      @application1 = Application.create(applicant: "John Doe", description: "I love dogs!!!", address: "Somewhere")
      @application2 = Application.create(applicant: "Jane Doe", description: "I love dogs more than John", address: "Somewhere")
    end

    it "determines whether application has pets" do
      expect(@application1.has_pets?).to eq(false)

      ApplicationPet.create(application: @application1, pet: @pet1)

      expect(@application1.has_pets?).to eq(true)
    end

    it "determines whether application has been submitted" do
      expect(@application1.submitted?).to eq(false)

      @application1.status = "Pending"
      @application1.save

      expect(@application1.submitted?).to eq(true)
    end

    it "checks whether status is approved or rejected" do
      pet1app1 = ApplicationPet.create(application: @application1, pet: @pet1)
      pet2app1 = ApplicationPet.create(application: @application1, pet: @pet2)


      pet3app2 = ApplicationPet.create(application: @application1, pet: @pet3)
      pet2app2 = ApplicationPet.create(application: @application1, pet: @pet2)

      @application1.status = "Pending"
      @application2.status = "Pending"

      @application1.save
      @application2.save

      pet1app1.status = "Approved"
      pet3app2.status = "Approved"
      pet1app1.save
      pet3app2.save

      @application1.check_status
      @application2.check_status

      expect(@application1.status).to eq("Pending")
      expect(@application2.status).to eq("Pending")

      pet2app1.status = "Rejected"
      pet2app2.status = "Approved"
      pet2app1.save
      pet2app2.save

      @application1.check_status
      @application2.check_status

      expect(@application1.status).to eq("Rejected")
      expect(@application2.status).to eq("Approved")
    end
  end

end
