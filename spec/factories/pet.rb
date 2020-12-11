FactoryBot.define do
  factory :pet do
    shelter
    image ""
    name { Faker::Creature::Dog.name}
    approximate_age { Faker::Name.age}
    description { ['Cat','Dog'].sample }
    adoptable { Faker::Boolean.boolean}
    sex { Faker::Name.gender}
  end
end
