# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
Recipe.destory_all

recipes = Recipe.create([
  {title: "Devil's Food Cake", img_url: "", description: "Delicious chocolatey cake", directions: "", bake_time: "30-35 minutes", baking_method: "9x9 square pan at 350 degrees", serving_size: "preferably more than one", user_id: 1}
  ])

ingredients = Ingredient.create([
  {amount: "1 1/2", measurement: "cups", ingredient_list: "flour", recipe_id: 1},
  {amount: "3", measurement: "", ingredient_list: "eggs", recipe_id: 1},
  {amount: "1", measurement: "lbs", ingredient_list: "chocolate", recipe_id: 1}
  ])
