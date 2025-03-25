# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'


puts "Destroying previous Foodies & Recipes"
User.destroy_all
Recipe.destroy_all
puts "Creating foodies..."
10.times do |user|
  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: Faker::Internet.username,
    bio: Faker::Coffee.notes,
    social: "Instagram",
    creator: true
  )
  user.save!
end
user = User.new(
  email:  Faker::Internet.email,
  password: "123456",
  user_name: "mattymatheson",
  bio: Faker::Coffee.notes,
  social: "Instagram",
  creator: true
)
user.save!


if user.persisted?

  recipe = Recipe.new(
    title: "Matty's Next Level White Ragu Baked Shells",
    ingredients: ["For the White Ragu:
                    Olive oil
                    1 pound ground pork
                    1 pound ground beef
                    2 carrots, diced
                    1 stalk celery, diced
                    1 onion, diced
                    6 garlic cloves, sliced
                    2 sprigs rosemary
                    1 small bunch sage
                    3 cups white wine
                    Kosher salt and black pepper
                    2 cups chicken stock", "For the Shell Filling:
                    1 (16 ounce) container ricotta
                    1 egg
                    1 cup grated Parmesan
                    Kosher salt and black pepper
                    ½ teaspoon lemon zest", "For the Topping:
                    Whole milk mozzarella
                    Parmesan"],
    method: ["Preheat the oven to 375°F.",
    "Mix the meat together in a large mixing bowl until fully combined.",
    "In a large, deep pot over medium heat, add the olive oil. Once the oil is lightly shimmering, add the meat in as little clumps, season with salt and pepper, and cook for 6-8 minutes, or until lightly browned. Remove with a slotted spoon, leaving any excess oil in the pot.",
    "Add the onion, carrot, celery and garlic and cook until the onion is translucent. Add the rosemary and sage and stir to combine. Return the meat back to the pan and season with salt and pepper. Add the wine and reduce it by half. Add chicken stock until everything is just barely covered. Reduce by half. Let simmer for at least a hour.",
    "While the meat and vegetables are cooking, add the pasta shells to boiling water and cook until el dente. ",
    "To a small bowl, combine ricotta, egg, parmesan, salt and pepper, and a zest of lemon. Mix until fully combined.",
    "Fill shells with the cheesy mixture. Fill the bottom of a casserole dish with the meat and veggies mixture. Top with grated parmesan. Fill the casserole with the cheese-filled pasta shells and top with another layer of grated parmesan. Drizzle with olive oil with a sprinkle of salt and pepper.",
    "Place in the preheated oven and bake until lightly browned. Plate and serve."],
    cuisine_type: "Italian",
    utensils: "None",
    dietary_restrictions: "Contains meat & dairy",
    recipe_hashtags: ["italian", "american", "canadian", "pasta", "parmesan"],
    cook_time: 90,
    user: user
  )
  recipe.save!
end

puts "Your Foodies & Recipes are ready"
