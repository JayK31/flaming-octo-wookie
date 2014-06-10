# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Trip.delete_all
Item.delete_all
Invite.delete_all

user_jay = User.create({name: "Jay", email: "jay@jay.com", password: "password", password_confirmation: "password"})
user_bilbo = User.create({name: "Bilbo", email: "bilbo@bilbo.com", password: "password", password_confirmation: "password"})
user_mike = User.create({name: "Mike", email: "doc@doc.com", password: "password", password_confirmation: "password"})
user_kelly = User.create({name: "Kelly", email: "jimbo@jimbo.com", password: "password", password_confirmation: "password"})

trip1 = Trip.create({name: "Roadtrip #1", description: "My first roadtrip!", start: "New York City, NY", destination: "San Francisco, CA", user_id: 1})
trip2 = Trip.create({name: "Roadtrip #2", description: "My second roadtrip!", start: "Baltimore, MD", destination: "Washington D.C.", user_id: 2})
trip3 = Trip.create({name: "Roadtrip #3", description: "My third roadtrip!", start: "Oklahoma City, OK", destination: "Atlanta, GA", user_id: 4})
trip4 = Trip.create({name: "Roadtrip #4", description: "My fourth roadtrip!", start: "Portland, OR", destination: "Chicago, IL", user_id: 3})
trip5 = Trip.create({name: "Coast to Coast", description: "First time visiting NYC", start: "Los Angeles, CA", destination: "New York City, NY", user_id: 1})
trip6 = Trip.create({name: "Midwest Trip", description: "Going to the midwest!", start: "California, CA", destination: "Milwaukee, WI", user_id: 3})
trip7 = Trip.create({name: "I-95", description: "Riding up the east coast", start: "Miami, FL", destination: "Boston, MA", user_id: 4})

item1 = Item.create({name: "Camera", quantity: 2, trip_id: 1, description: "take some sweet pics"})
item8 = Item.create({name: "Oreos", quantity: 1, trip_id: 1, description: "perfect roadie snack"})
item16 = Item.create({name: "Toothbrush", quantity: 1, trip_id: 1, description: "keep the pearly whites white"})
item2 = Item.create({name: "Witty Protest Sign", quantity: 1, trip_id: 2, description: "for stickin' it to the man"})
item10 = Item.create({name: "Band Aids", quantity: 1, trip_id: 2, description: "in case things get rough"})
item3 = Item.create({name: "Baseball Glove", quantity: 1, trip_id: 3, description: "catchin' a Braves game"})
item11 = Item.create({name: "Shower to Shower Powder", quantity: 2, trip_id: 3, description: "Atlanta's real humid"})
item4 = Item.create({name: "Windbreaker", quantity: 1, trip_id: 4, description: "ChiTown is windy they say"})
item9 = Item.create({name: "Mixed CDs", quantity: 2, trip_id: 4, description: "nothin' like jock jams"})
item12 = Item.create({name: "Beef Jerky", quantity: 1, trip_id: 4, description: "ultimate road trip snack"})
item13 = Item.create({name: "Camera", quantity: 1, trip_id: 5, description: "tall buildings"})
item5 = Item.create({name: "Neck/Back Massager", quantity: 1, trip_id: 5, description: "tall buildings"})
item6 = Item.create({name: "Fanny Pack", quantity: 1, trip_id: 6, description: "for lookin' cool"})
item14 = Item.create({name: "Wine Key", quantity: 1, trip_id: 6, description: "ya never know"})
item7 = Item.create({name: "TrailMix", quantity: 1, trip_id: 7, description: "mainly for the chocolate"})
item15 = Item.create({name: "Car Charger", quantity: 2, trip_id: 7, description: "to keep 2048'ing"})


invite1 = Invite.create({user_id: 1, trip_id: 2, is_going: true})
invite2 = Invite.create({user_id: 2, trip_id: 4, is_going: true})
invite3 = Invite.create({user_id: 3, trip_id: 5, is_going: true})
invite4 = Invite.create({user_id: 4, trip_id: 2, is_going: true})
invite5 = Invite.create({user_id: 2, trip_id: 1, is_going: true})
invite6 = Invite.create({user_id: 1, trip_id: 7, is_going: true})
invite7 = Invite.create({user_id: 3, trip_id: 4, is_going: true})






