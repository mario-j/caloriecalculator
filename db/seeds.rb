# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(sex: 'Male', age: 21, height: 72, weight: 140, lifestyle:'Sedentary')
User.create(sex: 'Female', age: 33, height: 75, weight: 170, lifestyle:'Very Active')
User.create(sex: 'Female', age: 52, height: 65, weight: 200, lifestyle:'Moderately Active')
