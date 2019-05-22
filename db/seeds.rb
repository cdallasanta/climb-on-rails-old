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
user1_attrs = {
  fullname: "Chris Dalla Santa",
  username: "cdallasanta",
  password: "p",
  role: "admin",
  site: orkila
}

user2_attrs = {
  fullname: "Jonathan Coulton",
  username: "codemonkey",
  password: "cmly",
  role: "facilitator",
  site: orkila
}

user3_attrs = {
  fullname: "Rain",
  username: "rain",
  password: "p",
  role: "lead",
  site: orkila
}

User.create(user1_attrs)
User.create(user2_attrs)
User.create(user3_attrs)


# sample elements
zipline = Element.create(name: "Zipline", site: orkila)
catwalk = Element.create(name: "Catwalk", site: orkila)


#sample ropes
Rope.create(primary_identifier: "North", element: zipline)
Rope.create(primary_identifier: "South", element: zipline)
Rope.create(primary_identifier: "green", secondary_identifier: "red", element: catwalk)
Rope.create(primary_identifier: "blue", secondary_identifier: "red", element: catwalk)
