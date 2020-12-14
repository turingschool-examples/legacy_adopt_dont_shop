# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Shelter.destroy_all

FactoryBot.create_list(:shelter, rand(2..5))

Shelter.all.each do |shelter|
    rand(3..5).times do
        FactoryBot.create(:pet, shelter: shelter)
    end
end

# FactoryBot.create(:applicant)
# FactoryBot.create(:application, applicant: @applicant1)

# ApplicationPet.create!(pet: @pet1, application: @application1)
# ApplicationPet.create!(pet: @pet2, application: @application1)
