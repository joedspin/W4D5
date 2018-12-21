FactoryBot.define do 
  factory :user do 
    username { Faker::StarWars.character }
    password { "starwars" }
  end 
end 