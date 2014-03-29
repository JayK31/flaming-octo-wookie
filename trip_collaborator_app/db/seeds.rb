# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_jay = User.create({name: "Jay", email: "jay@jay.com", password: "password", password_confirmation: "password"})
user_bilbo = User.create({name: "Bilbo", email: "bilbo@bilbo.com", password: "password", password_confirmation: "password"})
user_doc = User.create({name: "Doc", email: "doc@doc.com", password: "password", password_confirmation: "password"})
user_jimbo = User.create({name: "Jimbo", email: "jimbo@jimbo.com", password: "password", password_confirmation: "password"})

trip1 = Trip.create({start: "London", destination: "China", user_id: 1})
trip1 = Trip.create({start: "Ireland", destination: "Scotland", user_id: 2})
trip1 = Trip.create({start: "Finland", destination: "Florida", user_id: 4})
trip1 = Trip.create({start: "Maine", destination: "Japan", user_id: 3})
trip1 = Trip.create({start: "The Shire", destination: "Mordor", user_id: 1})
trip1 = Trip.create({start: "California", destination: "Milwaukee", user_id: 3})
trip1 = Trip.create({start: "Toronto", destination: "Nepal", user_id: 4})


