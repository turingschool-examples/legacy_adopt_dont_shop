FactoryBot.define do
  factory :shelter do

    name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Adress.city }
    state { Faker::Address.state }
    zip { Faker::Adress::Number.zip }
  end
end
