FactoryBot.define do
  factory :user_application do
    name {Faker::Name.unique.name}
    address {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state_abbr}
    zip_code {Faker::Address.zip}
    description {Faker::Artist.name}
  end
end
