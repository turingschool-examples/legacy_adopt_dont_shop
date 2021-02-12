require 'faker'

FactoryBot.define do
  factory :application do
    sequence(:name)  { |n| "application #{n}" }
    sequence(:address)  { |n| n }
    sequence(:description) { |n| "address #{n}" }
    adoptable { "true" }
    #i need to add application status

  end
end
