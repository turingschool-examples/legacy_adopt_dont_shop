# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Adoption.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
Applicant.destroy_all

shelter1 = Shelter.create!(
    name:'Hals Happy Home for Hounds',
    address: '4 Paws Place',
    city: 'Dogtown',
    state: 'CA',
    zip: 90405,
)

shelter2 = Shelter.create!(
    name:'Kathies Kathouse',
    address: '123  Rodeo Drive',
    city: 'Beverly Hills',
    state: 'CA',
    zip: 90210,
)

# shelter1.pets.create!(name: 'Buck',
#     approximate_age:    t.string "image"
#     t.string "name"
#     t.integer "approximate_age"
#     t.bigint "shelter_id"
#     t.string "description"
#     t.boolean "adoptable", default: true
#     t.integer "sex"

Shelter.all.each do |shelter|
    rand(3..5).times do
        FactoryBot.create(:pet, shelter: shelter)
    end
end

# FactoryBot.create_list(:applicant, rand(2..5))

# Applicant.all.each do |applicant|
#     FactoryBot.create(:application, applicant: applicant)
# end

# Application.all.each do |application|
#     pet = Pet.all.sample
#     Adoption.create!(pet: pet, application: application)
# end

# Pet.all.each do |pet|
#     application = Application.all.sample
#     Adoption.create!(pet: pet, application: application)
#     # pets = Pet.limit(2).order("RANDOM()")
# end