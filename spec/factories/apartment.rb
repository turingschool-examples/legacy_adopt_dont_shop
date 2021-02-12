require 'faker'

FactoryBot.define do
  factory :apartment do
    sequence(:name)  { |n| "apartment #{n}" }
    sequence(:years_old) { |n| n }
    sequence(:units) { |n|  n*10 }
    luxury { "true" }
  end
end
