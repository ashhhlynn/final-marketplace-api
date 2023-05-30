# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:"Ashley", email:"ashley@gmail.com", address:"144 st", password:"tnns12345", password_confirmation:"tnns12345", city:"Chicago", state:"Illinois", zip:"66610")
