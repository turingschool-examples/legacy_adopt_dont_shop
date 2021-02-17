# require 'faker'
#
# FactoryBot.define do
#   factory :pet do
#     name { FFaker::Name.first_name }
#     image { "image_" + "#{[*0..100].sample}" }
#     approximate_age { [*0..10].sample }
#     description { FFaker::Lorem.sentence(1) }
#     adoptable { true }
#     sex { [*0..1].sample }
#   end
# end
