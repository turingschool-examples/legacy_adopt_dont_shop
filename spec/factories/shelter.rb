FactoryBot.define do
  factory :shelter do
    name { FFaker::Education.school }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city  }
    state { FFaker::AddressUS.state}
    zip { "80302" }
  end
end
