FactoryBot.define do
  factory :pet do
    name { 'Daisy' }
    image { '' }
    description { 'dog' }
    approximate_age { 3 }
    sex { 'female'}
    shelter
  end
end
