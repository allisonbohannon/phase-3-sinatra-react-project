require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here

10.times do 
    Author.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name
    )
end

10.times do 
    Genre.create(
        genre: Faker::Book.genre
    )
end

50.times do
    Book.create(
        title: Faker::Book.title,
        read_status: 0, 
        author_id: rand(1..10),
        genre_id: rand(1..10)
    )
end

puts "✅ Done seeding!"
