FactoryBot.define do
  factory :application do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    case_for_adoption { "I love pets and want a dog!" }
    application_status { "In Progress" }

    trait :pending do
      application_status { "Pending" }
    end

    trait :accepted do
      application_status { "Accepted" }
    end

    trait :rejected do
      application_status { "Rejected" }
    end
  end
end
