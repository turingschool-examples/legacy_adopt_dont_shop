FactoryBot.define do
  factory :application do
    applicant_name {Faker::Name.name}
    street_address {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state_abbr}
    zip {Faker::Address.zip}
  end
end
