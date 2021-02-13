FactoryBot.define do
  factory :pet do

    image {""}
    name { Faker::Creature::Animal.name }
    description { Faker::Creature::Cat.breed }
    approximate_age { Faker::Number.within(range: 1..10) }
    sex { "male" or "female"}
    shelter
  end
end
