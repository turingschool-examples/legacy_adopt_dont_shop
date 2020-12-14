FactoryBot.define do
    factory :shelter do
        name {Faker::TvShows::Simpsons.location}
        # name {Faker::Cannabis.brand}
        address {Faker::Address.street_address}
        city {Faker::Address.city}
        state {Faker::Address.state_abbr}
        zip {Faker::Address.zip}
    end
    
    factory :pet do
        shelter
        name {Faker::Creature::Dog.name}
        description {Faker::Coffee.notes}
        approximate_age { rand(0..10) }
        sex { [0, 1].sample }
        # adoptable
        # image
    end

    factory :applicant do
      name {Faker::Name.name}
      address {Faker::Address.street_address}
      city {Faker::Address.city}
      state {Faker::Address.state_abbr}
      zip {Faker::Address.zip}
    end
  
    factory :application do
      description {Faker::Restaurant.description}
    end

    factory :application_pet do
      pet { nil }
      application { nil }
    end
  
end