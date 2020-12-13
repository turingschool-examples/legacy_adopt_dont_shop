FactoryBot.define do
  factory :application do
    name      {Faker::Name.name}
    address   {Faker::Address.street_name}
    city      {Faker::Address.city}
    state     {Faker::Address.state_abbreviation}
    zip_code  {Faker::Address.zipcode}
  end
end