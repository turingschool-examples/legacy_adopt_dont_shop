FactoryBot.define do
  factory :application do
    applicant_name { Faker::Name.name}
    applicant_address { Faker::Address.street_address}
    state { Faker::Address.state}
    city { Faker::Address.city}
    zip { Faker::Address.zip}
    description { Faker::Lorem.paragraph(sentence_count: 5)}
    status { ['In Progress','Pending','Accepted','Rejected'].sample }
  end
end
