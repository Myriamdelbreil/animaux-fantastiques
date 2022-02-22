# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Animal.destroy_all
User.destroy_all

user = User.create(username: "tests", email: "test@moment.com", password: "123456")

10.times do
  animal = Animal.new({ name: Faker::Creature::Animal.name, price: rand(50..100), category: "Licorne", description: "this is a test", user: User.first })
  animal.save!
end
