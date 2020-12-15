FactoryBot.define do
  factory :shelter do
    name      {"#{Faker::FunnyName.three_word_name} Memorial Shelter"}
    address   {Faker::Address.street_name}
    city      {Faker::Address.city}
    state     {Faker::Address.state_abbr}
    zip       {Faker::Address.zip_code}
  end
end