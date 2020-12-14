# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ApplicationPet.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
Applicant.destroy_all

FactoryBot.create_list(:shelter, rand(2..5))

Shelter.all.each do |shelter|
    rand(3..5).times do
        FactoryBot.create(:pet, shelter: shelter)
    end
end

FactoryBot.create_list(:applicant, rand(2..5))

Applicant.all.each do |applicant|
    FactoryBot.create(:application, applicant: applicant)
end

Application.all.each do |application|
    pet = Pet.all.sample
    ApplicationPet.create!(pet: pet, application: application)
end

Pet.all.each do |pet|
    application = Application.all.sample
    ApplicationPet.create!(pet: pet, application: application)
    # pets = Pet.limit(2).order("RANDOM()")
end