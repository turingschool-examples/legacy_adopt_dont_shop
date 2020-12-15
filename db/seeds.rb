# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PetApplication.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

rand(3..5).times do
  FactoryBot.create(:shelter)
end

rand(15..20).times do
  FactoryBot.create(:pet)
end

rand(10..15).times do
  application = FactoryBot.create(:application)
  pets = Pet.all.sample(rand(1..5))
  pets.each do |pet|
    PetApplication.create(application_id: application.id, pet_id: pet.id)
  end
  application.status = "Pending"
end

rand(5..10).times do
  application = FactoryBot.create(:application)
  pets = Pet.all.sample(rand(1..5))
  pets.each do |pet|
    PetApplication.create(application_id: application.id, pet_id: pet.id)
  end
  application.status = "Rejected"
end

# Don't seed Accepted applications until later
# rand(5..10).times do
#   application = FactoryBot.create(:application)
#   pets = Pet.all.sample(rand(1..5))
#   pets.each do |pet|
#     PetApplication.create(application_id: application.id, pet_id: pet.id)
#   end
#   application.status = "Accepted"
# end

# "In Progress", "Pending", "Accepted", or "Rejected"