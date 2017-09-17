# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
image_path = File.join(Rails.root, "db/Seed/sample.jpg")
50.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  title   = Faker::HarryPotter.quote
  content = Faker::Lorem.paragraph

  @user = User.create(email: email,
                      name: name,
                      password: password,
                      password_confirmation: password,
                      uid: n,
                      provider: ""
                      )

  @blog=Blog.create!(user_id: @user.id,
                     title: title,
                     content: content,
                     picture: File.new(image_path)
                     )

  Comment.create!(user_id: @user.id,
                  blog_id: @blog.id,
                  content: content
                  )
end

