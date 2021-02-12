require 'faker'

FactoryBot.define do
  factory :tenant do
    sequence(:name) { |n| "Title #{n}" }
    sequence(:age)  { |n| n + 18 }
    on_strike { "true" }
    apartment
  end
end
