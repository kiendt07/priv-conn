# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456')
end

2.times do
  c = Connection.new
  c.sender = User.first
  c.recipient = User.second
  c.initial = Message.create content: Faker::Hipster.sentence
  c.reply = Message.create content: Faker::Hipster.sentence
  c.save!
end
