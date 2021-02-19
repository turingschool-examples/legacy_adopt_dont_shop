# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PetApplication.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all

barking_lot = Shelter.create!(name: "The Barking Lot", address: "123 Hellhound St", city: "Dogtown", state: "CA", zip: 66666)
pooch_parlor = Shelter.create!(name: "Pooch Parlor", address: "1 Rodeo Drive", city: "Beverly Hills", state: "CA", zip: 90210)
pretty_paws = Shelter.create!(name: "Pretty Paws", address: "165 12th St", city: "Boston", state: "MA", zip: 87655)

barking_lot.pets.create!(name: 'Bob',
    approximate_age: 2,
    description: "Loves peanut butter, hates the vacuum",
    adoptable: true,
    sex: 'male')
barking_lot.pets.create!(name: 'Sonny',
    approximate_age: 5,
    description: "130 pound fluffball",
    adoptable: true,
    sex: 'female')
pooch_parlor.pets.create!(name: 'Ranger',
    approximate_age: 1,
    description: "He's a wonderful watch dog!",
    adoptable: true,
    sex: 'male')
pooch_parlor.pets.create!(name: 'Bud',
    approximate_age: 1,
    description: "Loves belly scratches",
    adoptable: true,
    sex: 'female')
pretty_paws.pets.create!(name: 'Squirt',
    approximate_age: 9,
    description: "blind, deaf, and a heart of gold",
    adoptable: true,
    sex: 'male')
pretty_paws.pets.create!(name: 'Sonny',
    approximate_age: 7,
    description: "Loveable and cuddly!",
    adoptable: true,
    sex: 'male')
