# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:purge db:migrate db:seed (to reset autoincremented ids)

Shelter.destroy_all
Pet.destroy_all

Application.destroy_all
ApplicationPet.destroy_all



shelter_2 = Shelter.create!(name: "Boulder Humane Society",
  address: "1234 Wallabe Way",
  city: "Boulder",
  state: "CO",
  zip: 80302)

pet1 = shelter_2.pets.create!(name: "Rex",
     sex: 1,
     adoptable: true,
     approximate_age: 2,
     description: "likes walks",
     image: "image_1.png")

pet2 = shelter_2.pets.create!(name: "Hedi",
     sex: 0,
     adoptable: true,
     approximate_age: 3,
     description: "likes barking",
     image: "image_2.png")

pet4 = shelter_2.pets.create!(name: "Hedo",
     sex: 0,
     adoptable: true,
     approximate_age: 3,
     description: "likes barking",
     image: "image_2.png")

pet3 = shelter_2.pets.create!(name: "Bork",
     sex: 0,
     adoptable: true,
     approximate_age: 3,
     description: "likes barking",
     image: "image_2.png")