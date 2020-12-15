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

sample(3..5).times do
  create(:shelter)
end

sample(15..20).times do
  create(:pet)
end

sample(10..15).times do
  applications = create(:application)
  applications.each do |app|
    pets = Pet.all.sample(1..5)
    pets.each do |pet|
      pet_applications.create(app.id, pet.id)
    end
  end
end

sample(5..10).times do
  applications = create(:application)
  applications.each do |app|
    app.status = "Rejected"
  end
end

# "In Progress", "Pending", "Accepted", or "Rejected"