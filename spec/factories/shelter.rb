FactoryBot.define do
  factory :shelter do
    name { Faker::Company.name}
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
  end
end
