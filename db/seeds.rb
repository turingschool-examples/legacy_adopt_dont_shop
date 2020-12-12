Pet.destroy_all
Shelter.destroy_all

FactoryBot.create_list(:shelter, rand(5..25))

Shelter.all.each do |shelter|
  rand(5..25).times do
    FactoryBot.create(:pet, shelter: shelter)
  end
end
