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

FactoryBot.create_list(:shelter, 2)

Shelter.all.each do |shelta|
  rand(1..10).times do
    shelta.pets.create!(name: FFaker::Name.first_name,
                        image: "image_" + "#{[*1..2].sample}",
                        approximate_age: [*0..10].sample,
                        description: FFaker::Lorem.sentence(1),
                        adoptable: true,
                        sex: [*0..1].sample)
  end
end

@bobby = Application.create!(name: "Bobby",
                             street: "756 6th st.",
                             city: "Boulder",
                             state: "CO",
                             zip_code: 80302,
                             application_status: "In Progress")

@elane = Application.create!(name: "Elane",
                             street: "1222 6th st.",
                             city: "Denver",
                             state: "CO",
                             zip_code: 80214,
                             application_status: "Pending",
                            description: "i want these pets")

@dane = Application.create!(name: "Dane",
                            street: "134 12th st.",
                            city: "Denver",
                            state: "CO",
                            zip_code: 80502,
                            application_status: "Pending",
                          description: "i want a pet")

ApplicationPet.create(application: @elane, pet: Pet.first, status: "Pending")
ApplicationPet.create(application: @elane, pet: Pet.second, status: "Pending")
ApplicationPet.create(application: @dane, pet: Pet.third, status: "Pending")
