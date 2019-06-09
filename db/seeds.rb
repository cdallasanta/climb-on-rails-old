# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Site
orkila = Site.create(name:"Orkila")

#Elements
catwalk = Element.create(name:"Catwalk", site: orkila)
zipline = Element.create(name:"Zipline", site: orkila)
giants_ladder = Element.create(name:"Giant's Ladder", site: orkila)

#rope
Rope.create(element:catwalk, identifier:"Olive with red pcord")
Rope.create(element:catwalk, identifier:"Blue with red pcord")
Rope.create(element:zipline, identifier:"North")
Rope.create(element:zipline, identifier:"South")
Rope.create(element:giants_ladder, identifier:"Red with orange pcord")
Rope.create(element:giants_ladder, identifier:"White with orange pcord")
Rope.create(element:giants_ladder, identifier:"Blue with orange pcord")

#Users
chris = User.create(
  fullname: "Chris Dalla Santa",
  email: "chris@email.com",
  password: "p",
  site: orkila,
  role: "admin"
)
liz = User.create(
  fullname: "Liz Doane",
  email: "liz@email.com",
  password: "p",
  site: orkila,
  role: "lead"
)
emily = User.create(
  fullname: "Emily Trusky",
  email: "emily@email.com",
  password: "p",
  site: orkila,
  role: "facilitator"
)
