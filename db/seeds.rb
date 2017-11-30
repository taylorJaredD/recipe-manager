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

test_user_recipes = Recipe.create([
  {title: "Devil's Food Cake", img_url: "http://www.joyofbaking.com/images/facebook/devilsfoodcake.jpg", description: "Delicious chocolatey cake", directions: "melt chocolate. beat eggs", bake_time: "30-35 minutes", baking_method: "9x9 square pan at 350 degrees", serving_size: "preferably more than one", user_id: test_user.id},
])

grammy_recipes = Recipe.create([
  {title: "Banana Nut Bread", img_url: "http://www.thespiffycookie.com/wp-content/uploads/2014/02/Mini-Caramelized-Banana-Nut-Bread-1024x682.jpg", description: "Warm and fluffy. Delicious when served with marmalade", directions: "", bake_time: "20 minutes", baking_method: "bread pan at 325", serving_size: "5", user_id: grammy.id},
  {title: "Chocolate Chip Cookies", img_url: "https://static01.nyt.com/images/2014/03/11/dining/chocolatecookie-still/chocolatecookie-still-articleLarge.jpg", description: "soft and gooey", directions: "", bake_time: "12 minutes", baking_method: "baking sheet", serving_size: "8", user_id: grammy.id},
  {title: "Strawberry Pie", img_url: "https://www.immaculatebaking.com/wp-content/uploads/hero-strawpie.jpg", description: "", directions: "", bake_time: "15-17 minutes", baking_method: "round, glass baking dish", serving_size: "6", user_id: grammy.id},
  {title: "Brownies", img_url: "http://res.cloudinary.com/hksqkdlah/image/upload/w_1200,h_630,c_fill/Vegan%20Microsite/SFS_Fudgy_Brownies-11", description: "moist and chewy", directions: "", bake_time: "18 minutes", baking_method: "9x9 square pan", serving_size: "7", user_id: grammy.id},

])

ingredients = Ingredient.create([
  {amount: "1 1/2", measurement: "cups", item: "flour", recipe: test_user_recipes[0]},
  {amount: "3", measurement: "", item: "eggs", recipe: test_user_recipes[0]},
  {amount: "1", measurement: "lbs", item: "chocolate", recipe: test_user_recipes[0]},
  {amount: "3", measurement: "", item: "ripe bananas", recipe: grammy_recipes[0]},
  {amount: "1", measurement: "cup", item: "crushed walnuts", recipe: grammy_recipes[0]},
  {amount: "a pinch", measurement: "", item: "salt", recipe: grammy_recipes[0]},
  {amount: "a dash", measurement: "", item: "honey", recipe: grammy_recipes[0]}
  ])
