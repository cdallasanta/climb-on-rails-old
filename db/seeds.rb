# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# sample site
orkila = Site.create(name:"Orkila")


# sample users
User.create(
  fullname: "Chris Dalla Santa",
  email: "chris@email.com",
  nickname: "Chris",
  password: "p",
  role: "admin",
  site: orkila
)

User.create(
  fullname: "Jonathan Coulton",
  nickname: "Joco",
  email: "joco@email.com",
  password: "cmly",
  role: "facilitator",
  site: orkila
)

User.create(
  fullname: "Emily Trusky",
  nickname: "Rain",
  email: "rain@email.com",
  password: "p",
  role: "lead",
  site: orkila
)


# sample elements
zipline = Element.create(name: "Zipline", site: orkila)
catwalk = Element.create(name: "Catwalk", site: orkila)


#sample ropes
Rope.create(primary_identifier: "north", element: zipline)
Rope.create(primary_identifier: "south", element: zipline)
Rope.create(primary_identifier: "green", secondary_identifier: "red", element: catwalk)
Rope.create(primary_identifier: "blue", secondary_identifier: "red", element: catwalk)
