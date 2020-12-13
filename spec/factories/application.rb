FactoryBot.define do 
  factory :application do 
    status {'In Progress'}
    name   {Faker::Name.name}
    street {Faker::Address.street_address}
    city   {Faker::Address.city}
    state  {Faker::Address.state_abbr}
    zip    {Faker::Address.zip}
  end
end 