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
trip2 = Trip.create({start: "Ireland", destination: "Scotland", user_id: 2})
trip3 = Trip.create({start: "Finland", destination: "Florida", user_id: 4})
trip4 = Trip.create({start: "Maine", destination: "Japan", user_id: 3})
trip5 = Trip.create({start: "The Shire", destination: "Mordor", user_id: 1})
trip6 = Trip.create({start: "California", destination: "Milwaukee", user_id: 3})
trip7 = Trip.create({start: "Toronto", destination: "Nepal", user_id: 4})

# item1 = Item.create({name: "bacon", quantity: 2, user_id: 1, trip_id: 1})
# item2 = Item.create({name: "sleeping bag", quantity: 1, user_id: 1, trip_id: 2})
# item3 = Item.create({name: "camping stove", quantity: 1, user_id: 1, trip_id: 3})
# item4 = Item.create({name: "tent", quantity: 1, user_id: 1, trip_id: 4})
# item5 = Item.create({name: "swimsuit", quantity: 1, user_id: 2, trip_id: 5})
# item6 = Item.create({name: "sunscreen", quantity: 1, user_id: 2, trip_id: 6})
# item7 = Item.create({name: "cooler", quantity: 1, user_id: 2, trip_id: 7})
# item8 = Item.create({name: "shovel", quantity: 1, user_id: 2, trip_id: 1})
# item9 = Item.create({name: "skis", quantity: 2, user_id: 3, trip_id: 4})
# item10 = Item.create({name: "ski pole", quantity: 1, user_id: 3, trip_id: 2})
# item11 = Item.create({name: "ski pants", quantity: 2, user_id: 3, trip_id: 3})
# item12 = Item.create({name: "goggles", quantity: 1, user_id: 3, trip_id: 4})
# item13 = Item.create({name: "glove", quantity: 1, user_id: 4, trip_id: 5})
# item14 = Item.create({name: "bat", quantity: 1, user_id: 4, trip_id: 6})
# item15 = Item.create({name: "uniform", quantity: 2, user_id: 4, trip_id: 7})
# item16 = Item.create({name: "cleats", quantity: 1, user_id: 4, trip_id: 1})



