FactoryBot.define do
  factory :pet do
    name              {Faker::Creature::Dog.unique.name}
    image             {Faker::Avatar.image}
    approximate_age   {rand(1..15)}
    shelter_id        {Shelter.all.sample.id}
    description       {(Faker::Lorem.sentences(number: 2)).join(" ")}
    adoptable         {true}
    sex               {["male", "female"].sample}
  end
end