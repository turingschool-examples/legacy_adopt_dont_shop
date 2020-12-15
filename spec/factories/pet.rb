factory :pet do
  name              {Faker::Creature::Dog.name}
  image             {"img.png"}
  approximate_age   {sample(1..15).random}
  shelter_id        {Shelter.all.sample.id}
  description       {""}
  adoptable         {[true, false].sample}
  sex               {["male", "female"].sample}
end