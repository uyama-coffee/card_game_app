# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do |n|
    email=Faker::Internet.email
    password="password"
    Shop.create!(email: email,
                 password: password,
                 password_confirmation: password
                 )
end

2.times do |n|
    email=Faker::Internet.email
    password="password"
    User.create!(email: email,
                 password: password,
                 password_confirmation: password
                 )
end

1.times do |n|
  Resume.create!(
    profile_image: "",
    first_name: Faker::Name.first_name,
    first_name_kana: "",
    last_name: Faker::Name.last_name,
    last_name_kana: "",
    contact_method: 1,
    phone_number: Faker::PhoneNumber,
    user_id: 2
  )
end
