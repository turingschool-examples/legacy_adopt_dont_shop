FactoryBot.define do
  factory :pet do

    image {""}
    name { Faker::Creature::Animal::FunnyName.name }
    description { Faker::Creature::Cat.description }
    approximate_age { Faker::Number.within(range: 1..10) }
    sex { "male" or "female"}
    shelter
  end
end
