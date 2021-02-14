require 'faker'

FactoryBot.define do
  factory :pet do
    image {''}
    sequence(:name)  { |n| "pet #{n}" }
    sequence(:approximate_age)  { |n| n }
    sequence(:description)  { |n| "Description #{n}" }
    adoptable {true}
    sex { 'male'}
    shelter
  end
end
