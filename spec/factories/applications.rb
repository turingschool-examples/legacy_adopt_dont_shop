require 'faker'

FactoryBot.define do
  factory :application do
    sequence(:name)  { |n| "application #{n}" }
    sequence(:address)  { |n| n }
    sequence(:description) { |n| "description #{n}" }
    status {'pending'}
    #i need to add application status
    #create_list(:pets, 3, :application)

  end
end
