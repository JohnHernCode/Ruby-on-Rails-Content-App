require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# generate 20 users
(1..20).each do |id|
  User.create!(
# each user is assigned an id from 1-20
      id: id, 
      name: Faker::Name.name,
# issue each user the same password
      password: "password", 
      password_confirmation: "password",
  )
end

Article.create(
  title: Faker::Coffee.blend_name,
  content: Faker::Coffee.notes,  
  views: Faker::Number.number(digits: 3),
  user_id: User.first.id,
  image.attach(io: File.open('../rayme1.png'), filename: 'rayme1.png', content_type: 'image/png')
)