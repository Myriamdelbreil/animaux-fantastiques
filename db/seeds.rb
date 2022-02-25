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

loulou = User.create(username: "loulou", email: "loulou@gmail.com", password: "123456", address: "Place du Panthéon 75005 Paris")
pcoppy = User.create(username: "pcoppy", email: "pcoppy@gmail.com", password: "123456", address: "Musée du Louvre 75001 Paris")
tomtom = User.create(username: "tomtom", email: "tomtom@gmail.com", password: "123456", address: "Palais de Matignon 75008 Paris")
mymyy = User.create(username: "mymyy", email: "mymy@gmail.com", password: "123456", address: "Palais de l'Elysée, 75008 Paris")
