# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
num_movies = 10

puts "SEEDING BEGIN"
puts "  creating #{num_movies} fake movies..."

# Movie.destroy_all # uncomment if you want to clear the existing db

num_movies.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: Faker::Internet.url,
    rating: [1..10].select
  )
  if movie.save
    puts "    added movie #{movie.title}, #{movie.overview} to the DB!"
  else
    puts "    ERROR: failed to save movie #{movie.title}, #{movie.overview} to the DB :("
    puts "      REASON: #{movie.errors.inspect}"
  end
end
puts "  seeding finished, the movies database has #{Movie.count} entries"
puts "SEEDING END"
