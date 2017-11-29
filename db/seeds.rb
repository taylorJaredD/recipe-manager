# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Ingredient.destroy_all
Recipe.destroy_all

test_user = User.create(email: "test1@test.com", password: "password")
grammy = User.create(email: "grammybakery@sweet.treats", password: "sweettooth")

recipe = Recipe.create([
  {title: "Devil's Food Cake", img_url: "", description: "Delicious chocolatey cake", directions: "melt chocolate. beat eggs", bake_time: "30-35 minutes", baking_method: "9x9 square pan at 350 degrees", serving_size: "preferably more than one", user_id: test_user.id},
  {title: "", img_url: "", description: "", deirections: "", bake_time: "", baking_method: "", serving_size: "", user_id: grammy.id},

])

ingredients = Ingredient.create([
  {amount: "1 1/2", measurement: "cups", item: "flour", recipe_id: 1},
  {amount: "3", measurement: "", item: "eggs", recipe_id: 1},
  {amount: "1", measurement: "lbs", item: "chocolate", recipe_id: 1},
  
  ])
