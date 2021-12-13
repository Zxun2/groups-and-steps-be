require 'faker'

FactoryBot.define do
    factory :item do
      step { Faker::Movies::StarWars.character }
      completed { false }
      todo_id { nil }
    end
end