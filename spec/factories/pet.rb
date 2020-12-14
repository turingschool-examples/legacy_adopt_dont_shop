FactoryBot.define do
  factory :pet do
    image {Faker::Avatar.image}
    name {Faker::FunnyName.unique.name}
    description {Faker::Beer.name}
    approximate_age {Faker::Number.number(digits: 2)}
    sex {[:male, :female].sample}
  end
end