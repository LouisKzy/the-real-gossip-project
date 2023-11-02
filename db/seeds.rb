# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all

10.times do 
    City.create(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end

10.times do 
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Fantasy::Tolkien.poem,
        age: Faker::Number.between(from: 18, to: 99),
        city: City.all.sample
    )
end

20.times do 
    Gossip.create(
        title: Faker::Book.title,
        content: Faker::ChuckNorris.fact,
        user: User.all.sample
    )
end