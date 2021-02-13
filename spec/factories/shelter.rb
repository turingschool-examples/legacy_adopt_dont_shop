FactoryBot.define do
  factory :shelter do
    sequence :name do |n|
      "Shelter #{n}"
    end

    address { "123 Shady Ave" }
    city { "Denver" }
    state { "CO" }
    zip { 80012 }
  end
end
