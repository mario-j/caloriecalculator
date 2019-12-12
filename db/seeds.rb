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


food_list = [
  #McDonalds Breakfast
  [ "Egg McMuffin", "1 McMuffin", 300, "breakfast" ],
  [ "Sausage McMuffin with Egg", "1 McMuffin", 480, "breakfast" ],
  [ "Bacon, Egg & Cheese Biscuit", "1 Biscuit", 450, "breakfast" ],
  [ "Sausage Biscuit", "1 Biscuit", 460, "breakfast" ],
  [ "Sausage Biscuit with Egg", "1 Biscuit", 530, "breakfast" ],
  [ "Bacon, Egg & Cheese McGriddle", "1 McGriddle", 420, "breakfast" ],
  [ "Sausage McGriddle", "1 McGriddle", 430, "breakfast" ],
  [ "Sausage Egg & Cheese McGriddle", "1 McGriddle", 550, "breakfast" ],
  [ "Bacon, Egg & Cheese Bagel", "1 Bagel", 550, "breakfast" ],
  [ "Hotcakes", "3 Hotcakes", 590, "breakfast" ],
  [ "Sausage Burrito", "1 Burrito", 300, "breakfast" ],
  [ "Hash Brown", "1 Hash Brown", 150, "breakfast" ],
  
  #McDonalds Lunch and Dinner
  
  #Burgers
  [ "Hamburger", "1 Burger", 250, "ld" ],
  [ "Cheeseburger", "1 Burger", 300, "ld" ],
  [ "McDouble", "1 Burger", 390, "ld" ],
  [ "Double Cheeseburger", "1 Burger", 440, "ld" ],
  [ "Quarter Pounder with Cheese Bacon", "1 Burger", 640, "ld" ],
  [ "Quarter Pounder with Cheese Deluxe", "1 Burger", 650, "ld" ],
  [ "Double Quarter Pounder with Cheese", "1 Burger", 780, "ld" ],
  [ "Quarter Pounder with Cheese", "1 Burger", 510, "ld" ],
  [ "Big Mac", "1 Burger", 540, "ld" ],
  [ "Double Bacon BBQ Burger", "1 Burger", 920, "ld" ],
  [ "Bacon BBQ Burger", "1 Burger", 710, "ld" ],
  
  #Chicken and Sandwiches (ip)
  [ "4 piece Chicken McNuggets", "4 Nuggets", 170, "ld" ]
  
]

food_list.each do |name, serving_size, calories, food_type|
  Food.create( name: name, serving_size: serving_size, calories: calories, food_type: food_type )
end

