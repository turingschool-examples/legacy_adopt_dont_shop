# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.destroy_all
Pet.destroy_all
Application.destroy_all

@shelter1 = Shelter.create!(name: "Just for Paws", address: "123 Amber St", city: "Littleton", state: "CO", zip: 80011)
@shelter2 = Shelter.create!(name: "OutPaws", address: "224 Exelon Dr", city: "Golden", state: "CO", zip: 80401)
@shelter3 = Shelter.create!(name: "Tom Pawyer's", address: "884 Enderon Circle", city: "Commerce City", state: "CO", zip: 80022)
@pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
@pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
@pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
@pet4 = @shelter3.pets.create!(image:"", name: "Lunar", description: "cat", approximate_age: 3, sex: "female")
@pet5 = @shelter3.pets.create!(image:"", name: "Tunar", description: "cat", approximate_age: 3, sex: "male")

@jenn = Application.create!(name:'Jenny O', address:'455 Zim Street', city:'Valporia', state:'Illinois', zip:'74515', description:'welcoming young family looking for energetic dogs good with kids')
@bill = Application.create!(name:'Billy B', address:'120 Anchor Ave', city:'Dreamland', state:'Michigan', zip:'85142', description:'aging widower looking for a lazy cat for quiet companionship')
@chaz = Application.create!(name:'Chaz X', address:'3904 Chapel Drive', city:'Sarasota', state:'Florida', zip:'34243', description:'recently married couple looking for a furry friend, no dog or cat preference')

# remove assignment below to test for application functionality

@jenn.pets << @pet1
@jenn.pets << @pet3

@bill.pets << @pet2
@bill.pets << @pet4

@chaz.pets << @pet1
@chaz.pets << @pet2
@chaz.pets << @pet3
@chaz.pets << @pet4
