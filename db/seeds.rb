# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:"Ashley", email:"ashley@gmail.com", address:"144 st", password:"tnns12345", password_confirmation:"tnns12345", city:"Chicago", state:"Illinois", zip:"66610")
Product.create!(title: "Star Jasmine", price:"17", user_id: 1, image_url:"https://i.etsystatic.com/26683703/r/il/d0b6b3/4914577738/il_1588xN.4914577738_mjll.jpg", description:"Water a lot in the summer, test", sold:"false")
