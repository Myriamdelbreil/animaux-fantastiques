# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Booking.destroy_all
Animal.destroy_all
User.destroy_all

CATEGORIES = ["Acromentula", "Centaur", "Dragon", "Hippogryph", "Leprechaun", "Phoenix", "Troll", "Unicorn", "Werewolf"]

addresses = ["29 Rue Delambre, 75014 Paris", "49 Rue de la Harpe, 75005 Paris", "23 Boulevard des Italiens, 75002 Paris", "15 Rue de la Reynie, 75004 Paris", "36 Rue Richelieu, 75001 Paris", "12 Rue du Colonel Manhes, 75017 Paris", "12 Rue des Messageries, 75010 Paris", "52 Rue Francois 1er, 75008 Paris", "10 Bis Avenue de la Grande Armee, 75017 Paris"]

addresses.each do |address|
  User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: "123456", address: address)
end

2.times do
  User.all.each do |user|
    animal = Animal.new(name: Faker::Creature::Animal.name, price: rand(50..100), category: CATEGORIES.sample, description: Faker::Lorem.paragraphs(number: 2).first, user: user)
    animal.save!
  end
end
