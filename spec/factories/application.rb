FactoryBot.define do
  factory :application do
    first_name { 'Jenny' }
    last_name { 'Branham' }
    address { '123 Shady Ave' }
    city { 'Denver' }
    state { 'CO' }
    zipcode { 80012 }
  end
end
