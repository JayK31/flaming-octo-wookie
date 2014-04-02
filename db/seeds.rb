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

item1 = Item.create({name: "bacon", quantity: 2, trip_id: 1, description: "yummy bacon"})
item2 = Item.create({name: "sleeping bag", quantity: 1, trip_id: 2, description: "comfy sleeping bag"})
item3 = Item.create({name: "camping stove", quantity: 1, trip_id: 3, description: "useful camping stove"})
item4 = Item.create({name: "tent", quantity: 1, trip_id: 4, description: "party palace tent"})
item5 = Item.create({name: "swimsuit", quantity: 1, trip_id: 5, description: "super tight swimsuit"})
item6 = Item.create({name: "sunscreen", quantity: 1, trip_id: 6, description: "white skin protector"})
item7 = Item.create({name: "cooler", quantity: 1, trip_id: 7, description: "for all beer"})
item8 = Item.create({name: "shovel", quantity: 1, trip_id: 1, description: "for digging sand"})
item9 = Item.create({name: "skis", quantity: 2, trip_id: 4, description: "for digging snow"})
item10 = Item.create({name: "ski pole", quantity: 1, trip_id: 2, description: "can't fall now"})
item11 = Item.create({name: "ski pants", quantity: 2, trip_id: 3, description: "keep me warm"})
item12 = Item.create({name: "goggles", quantity: 1, trip_id: 4, description: "protect my eyes"})
item13 = Item.create({name: "glove", quantity: 1, trip_id: 5, description: "baseball is fun"})
item14 = Item.create({name: "bat", quantity: 1, trip_id: 6, description: "baseball is fun"})
item15 = Item.create({name: "uniform", quantity: 2, trip_id: 7, description: "for lookin' good"})
item16 = Item.create({name: "cleats", quantity: 1, trip_id: 1, description: "for curb stomping"})
item17 = Item.create({name: "headhones", quantity: 1, trip_id: 6, description: "for music", is_claimed: true})


invite1 = Invite.create({user_id: 1, trip_id: 2, is_going: true})
invite2 = Invite.create({user_id: 2, trip_id: 4, is_going: true})
invite3 = Invite.create({user_id: 3, trip_id: 5, is_going: true})
invite4 = Invite.create({user_id: 4, trip_id: 2, is_going: true})
invite5 = Invite.create({user_id: 2, trip_id: 1, is_going: true})
invite6 = Invite.create({user_id: 1, trip_id: 7, is_going: true})
invite7 = Invite.create({user_id: 3, trip_id: 4, is_going: true})





