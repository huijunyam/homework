# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

house1 = House.create!(address: "Howard St")
house2 = House.create!(address: "Market St")

person1 = Person.create!(name: "Hui Jun", house_id: 1)
person2 = Person.create!(name: "John", house_id: 2)
person3 = Person.create!(name: "Sarah", house_id: 1)
