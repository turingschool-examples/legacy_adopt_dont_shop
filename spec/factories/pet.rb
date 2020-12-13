FactoryBot.define do
  factory :pet do
    image {""}
    name {Faker::Creature::Dog.name}
    approximate_age {2}
    description {Faker::Company.bs}
    sex {"M"}
  end
end


