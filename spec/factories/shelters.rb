require 'faker'

FactoryBot.define do
  factory :shelter do
    sequence(:name)  { |n| "Name #{n}" }
    sequence(:address) { |n| n }
    sequence(:city) { |n| "city #{n}" }
    sequence(:state) { |n| "state #{n}" }
    sequence(:zip) { |n| n*10 }
  end
end
