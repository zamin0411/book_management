# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Admin
User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             role: :admin)

# Manager
User.create!(name: 'manager',
             email: 'manager@gmail.com',
             password: '123123',
             password_confirmation: '123123',
             role: :manager)

# Regular user
User.create!(name: 'Zamin',
             email: 'giamanho37@gmail.com',
             password: '123123',
             password_confirmation: '123123')

# Generate a bunch of categories.
30.times do
  Category.create!(name: Faker::Book.unique.genre)
end

# Generate a bunch of books.
30.times do
  Book.create!(name: Faker::Book.title,
               author: Faker::Book.author,
               image: Faker::LoremFlickr.image,
               description: Faker::Lorem.sentence(word_count: 10),
               status: :published,
               content: Faker::Lorem.paragraph(sentence_count: 100),
               category: Category.all.sample)
end
