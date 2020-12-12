FactoryBot.define do
  factory :applicant_pet do
    pet { nil }
    applicant { nil }
  end

  factory :playlist_song do
    id { "" }
    applicant_id { "" }
    pet_id { "MyString" }
    bigint { "MyString" }
  end

  factory :applicant do
    
  end

    factory :shelter do
        name {Faker::Restaurant.name}
        address {Faker::Address.street_address}
        city {Faker::Address.city}
        state {Faker::Address.state_abbr}
        zip {Faker::Address.zip}
    end
    
    factory :pet do
        shelter
        name {Faker::Creature::Dog.name}
        description {Faker::Marketing.buzzwords}
        approximate_age { rand(0..10) }
        sex { [0, 1].sample }
        # adoptable
        # image
    end
end