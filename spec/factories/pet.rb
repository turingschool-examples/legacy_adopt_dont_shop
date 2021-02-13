FactoryBot.define do
  factory :pet do
    image { Faker::FunnyName.name }
    name { Faker::Name.name }
    approximate_age { Faker::Number.between(from: 1, to: 10) }
    description { Faker::ChuckNorris.fact }
    adoptable { true }
    sex { 1 }
  end
end
