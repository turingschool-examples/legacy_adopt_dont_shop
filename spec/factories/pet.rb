FactoryBot.define do 
  factory :pet do 
    shelter
    image            {""} 
    name             {Faker::Creature::Dog.name} 
    description      {Faker::Creature::Dog.meme_phrase} 
    approximate_age  {Faker::Number.between(from: 0, to: 15)}
    sex              {Faker::Gender.binary_type.downcase}
  end
end