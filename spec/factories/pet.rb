require 'faker'

FactoryBot.define do
  factory :pet do
    sequence(:image)  { |n| "image #{n}" }
    sequence(:name)  { |n| "pet #{n}" }
    sequence(:approximate_age)  { |n| n }
    sequence(:description) { |n| }
    adoptable { "true" }
    sex(:sex)
    shelter
  end
end
