require 'faker'

FactoryBot.define do
  factory :book do |b|
    b.name { Faker::Book.title }
    b.author { Faker::Book.author }
    b.image { Faker::LoremFlickr.image }
    b.category_id { FactoryBot.create(:category).id }
    b.status {:published}
    b.description { Faker::Lorem.paragraph }
    b.content { Faker::Lorem.paragraph }
  end
end
