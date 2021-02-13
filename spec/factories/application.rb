FactoryBot.define do
  factory :aplication do
    name { Faker::Name.name}
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    description { "" }
    status { "In Progress" or "Pending" or "Accepted" or "Rejected" }
  end
end
