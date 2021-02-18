require 'faker'

FactoryBot.define do
  factory :application do
    sequence(:name)  { |n| "application #{n}" }
    sequence(:address)  { |n| n }
    status {'In Progress'}
    #create_list(:pets, 3, :application)

  end
end
