require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# generate 20 users
(1..10).each do |id|
  User.create!(
    # each user is assigned an id from 1-20
    id: id, 
    name: Faker::Name.name,
    # issue each user the same password
    password: "password", 
    password_confirmation: "password",
  )
end

if Article.count.zero?
  7.times do
    b = Article.new
    b.title = Faker::Coffee.blend_name
    b.text = Faker::Coffee.notes
    b.author_id = User.first.id
    File.open('./app/assets/images/deadpooldif.jpg') { |f| b.image = f }
    b.save
  end
end

Category.create({"name"=>"Video Games", "priority"=>1})
Category.create({"name"=>"Movies", "priority"=>2})
Category.create({"name"=>"Comics", "priority"=>3})
Category.create({"name"=>"Books", "priority"=>4})
Category.create({"name"=>"TV Shows", "priority"=>5})
Category.create({"name"=>"Tshirts", "priority"=>6})
Category.create({"name"=>"Hats", "priority"=>7})

ArticleCategory.create({"category_id"=>1, "article_id"=>1})
ArticleCategory.create({"category_id"=>2, "article_id"=>2})
ArticleCategory.create({"category_id"=>3, "article_id"=>3})
ArticleCategory.create({"category_id"=>4, "article_id"=>4})
ArticleCategory.create({"category_id"=>5, "article_id"=>5})
ArticleCategory.create({"category_id"=>6, "article_id"=>6})
ArticleCategory.create({"category_id"=>7, "article_id"=>7})

Vote.create({"user_id"=>1, "article_id"=>2})
Vote.create({"user_id"=>1, "article_id"=>1})
Vote.create({"user_id"=>2, "article_id"=>2})