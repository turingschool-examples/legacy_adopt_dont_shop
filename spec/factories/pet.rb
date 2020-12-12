FactoryBot.define do
  factory :pet do
    shelter
    image {""}
    name { Faker::Creature::Dog.name}
    approximate_age { Faker::Number.number(digits: 2)}
    description { ['Cat','Dog'].sample }
    adoptable { Faker::Boolean.boolean}
    sex { Faker::Gender.binary_type.downcase}
  end
end
