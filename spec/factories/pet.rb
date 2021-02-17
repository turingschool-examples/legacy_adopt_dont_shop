FactoryBot.define do
  factory :pet do

    image {""}
    name { Faker::Creature::Animal.name }
    description { Faker::Creature::Cat.breed }
    approximate_age { Faker::Number.between(from: 1, to: 10) }
    sex { "male" or "female"}
    shelter
  end
end
