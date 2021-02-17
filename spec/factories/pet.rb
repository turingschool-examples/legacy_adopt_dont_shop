FactoryBot.define do
  factory :pet do
    image { "" }
    name { Faker::Creature::Animal.name }
    description { Faker::Creature::Dog.breed }
    approximate_age { Faker::Number.between(from: 0, to: 10) }
    sex { "male" or "female" }
    shelter
  end
end
