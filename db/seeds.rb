# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Destroying all creators...'
Creator.destroy_all
puts 'Creators destroyed!'

puts 'Creating creators...'
5.times do
  creator = Creator.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    )
  creator.save!
end
puts 'Creators created!'

# --------------------------------------------------

puts 'Creating gigs...'
creators = Creator.all
3.times do
  creators.each do |creator|
    gig = Gig.new(
    brand_name: Faker::Company.name,
    creator: creator
    )
    gig.save!
  end
end

puts 'Gigs created!'
