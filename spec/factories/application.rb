FactoryBot.define do
  factory :application do

  applicant_name { Faker::Name.name}
  address { Faker::Address.street_address}
  city { Faker::Address.city}
  state { Faker::Address.state}
  zip { Faker::Address.zip}
  description {""}
  adoptable_pets { Faker::Creature::Animal.name }
  application_status { Faker::Boolean.boolean }
  end
end
