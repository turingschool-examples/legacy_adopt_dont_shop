# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter = Shelter.create(name:"EYES OF AN ANGEL")

pet = Pet.create!(name: "fido", description: "cute dog", approximate_age: 1, sex:"male", shelter_id: shelter.id )
pet = Pet.create!(name: "Fluffy", description: "flussy ass dog", approximate_age: 2, sex:"female", shelter_id: shelter.id)
pet = Pet.create!(name: "fluff", description: "Fluff ball pup", approximate_age: 5, sex: "female", shelter_id: shelter.id)
pet = Pet.create!(name: "fluf", description: "sheeba enu", approximate_age: 7, sex: "male", shelter_id: shelter.id)
pet = Pet.create!(name: "jim", description: "weimerhiner", approximate_age: 9, sex: "male", shelter_id: shelter.id)
pet = Pet.create!(name: "Muna", description: "Collie", approximate_age: 16, sex: "female", shelter_id: shelter.id)
