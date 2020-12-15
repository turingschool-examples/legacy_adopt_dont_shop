FactoryBot.define do
  factory :shelter do
    name      {Faker::Name.name}
    address   {Faker::Address.street_name}
    city      {Faker::Address.city}
    state     {Faker::Address.state_abbr}
    zip       {Faker::Address.zip_code}
  end
end