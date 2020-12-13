FactoryBot.define do
  factory :application do
    applicant_name { Faker::Name.name}
    applicant_address { Faker::Address.street_address}
    state { Faker::Address.state}
    city { Faker::Address.city}
    zip { Faker::Address.zip}
  end
end
