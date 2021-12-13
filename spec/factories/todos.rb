# By wrapping Faker methods in a block, 
# we ensure that Faker generates dynamic data every time the factory is invoked.
FactoryBot.define do
    factory :todo do
      title { Faker::Lorem.word }
      created_by { Faker::Number.number(digits: 10) }
    end
end