ApplicationPet.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all

FactoryBot.create_list(:shelter, rand(2..10))

Shelter.all.each do |shelter|
  rand(2..10).times do
    FactoryBot.create(:pet, shelter: shelter)
  end
end
