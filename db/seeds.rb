# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "brian.mcelaney@gmail.com")
Brewery.create!(name: "Dogfish Head")
Brewery.create!(name: "Philadelphia Brewing Company")
Beer.create!(name: "60 Minute IPA", brewery: Brewery.first)
Beer.create!(name: "Kensinger", brewery: Brewery.last)
Beer.create!(name: "Walt Wit", brewery: Brewery.last)

Rating.create!(beer:Beer.first, user: User.first, rank: 3)
Rating.create!(beer:Beer.last, user: User.first, rank: 4)