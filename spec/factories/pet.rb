FactoryBot.define do
  factory :pet do
    shelter
    name { Faker::Creature::Dog.name}
    approximate_age { Faker::Number.number(digits: 2)}
    description { ['Cat','Dog'].sample }
    sex { Faker::Gender.binary_type.downcase}
  end
end
