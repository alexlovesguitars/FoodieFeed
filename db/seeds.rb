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
require 'open-uri'

puts "Destroying previous Recipes"

Recipe.destroy_all

puts "Destroying previous Foodies"

User.destroy_all

puts "Creating foodies..."

# 1 Matty Matheson - Ragu

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "mattymatheson",
    bio: Faker::Coffee.notes,
    instagram: "https://www.instagram.com/mattymatheson",
    youtube:  "https://www.youtube.com/@mattymatheson",
    creator: true,
    avatar_link: "https://res.cloudinary.com/dmj0udbma/image/upload/v1743234531/osfvvfyhppp3mzs1l0jz.webp"
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_MattyMatheson.png")["url"]), filename: "Profile_MattyMatheson.png")
  user.save!


  if user.persisted?

    recipe = Recipe.new(
      title: "White Ragu Shells",
      ingredients: ["For the White Ragu:",
                    "Olive oil", "1 pound ground pork", "1 pound ground beef", "2 carrots, diced", "1 stalk celery, diced", "1 onion, diced", "6 garlic cloves, sliced", "2 sprigs rosemary", "1 small bunch sage", "3 cups white wine", "Kosher salt and black pepper", "2 cups chicken stock",
                    "For the Shell Filling:", "1 (16 ounce) container ricotta", "1 egg", "1 cup grated Parmesan", "Kosher salt and black pepper", "½ teaspoon lemon zest",
                    "For the Topping:",
                    "Whole milk mozzarella", "Parmesan"],
      method: ["Preheat the oven to 375°F.",
      "Mix the meat together in a large mixing bowl until fully combined.",
      "In a large, deep pot over medium heat, add the olive oil. Once the oil is lightly shimmering, add the meat in as little clumps, season with salt and pepper, and cook for 6-8 minutes, or until lightly browned. Remove with a slotted spoon, leaving any excess oil in the pot.",
      "Add the onion, carrot, celery and garlic and cook until the onion is translucent. Add the rosemary and sage and stir to combine. Return the meat back to the pan and season with salt and pepper. Add the wine and reduce it by half. Add chicken stock until everything is just barely covered. Reduce by half. Let simmer for at least a hour.",
      "While the meat and vegetables are cooking, add the pasta shells to boiling water and cook until el dente. ",
      "To a small bowl, combine ricotta, egg, parmesan, salt and pepper, and a zest of lemon. Mix until fully combined.",
      "Fill shells with the cheesy mixture. Fill the bottom of a casserole dish with the meat and veggies mixture. Top with grated parmesan. Fill the casserole with the cheese-filled pasta shells and top with another layer of grated parmesan. Drizzle with olive oil with a sprinkle of salt and pepper.",
      "Place in the preheated oven and bake until lightly browned. Plate and serve."],
      cuisine_type: "Italian",
      description: "This recipe will warm your heart & your gut! Everyone loves a good Ragu!",
      utensils: "None",
      dietary_restrictions: "Omnivore",
      recipe_hashtags: ["italian", "american", "canadian", "pasta", "parmesan"],
      cook_time: 90,
      user: user,
      video_link: "https://www.youtube.com/embed/8gvdG2bpOEc?si=n4fSelIj4i7PRX9I",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_MattyMatheson.png")["url"]), filename: "Recipe_MattyMatheson.png")
    recipe.save!
  end

# 2 Nigella Lawson - Turkish Eggs

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "nigellalawson",
    bio: "Nigella has been teaching us about the pleasures of the table since her first book, How to Eat, hit the shelves in 1998. She has since published several best-selling cookery books, many complementing an accompanying television series, and has become known for her sensual descriptions of her dishes.",
    instagram: "https://www.instagram.com/nigellalawson",
    creator: true,
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_nigellaLawson.jpg")["url"]), filename: "Profile_nigellaLawson.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Turkish Eggs",
      ingredients: ["200g/7oz Greek-style plain yoghurt", "1 garlic clove, crushed", "1 tsp sea salt flakes", "2 tbsp unsalted butter", "1 tbsp extra virgin olive oil", "1 tsp Aleppo pepper", "2 large free-range eggs, fridge cold", "2 tsp lemon juice", "few fronds fresh dill, chopped", "thick sourdough toast, to serve"],
      method: ["Fill a saucepan up to 4cm/1½in deep with water and bring to the boil. Place the yoghurt into a heatproof bowl large enough to sit over the pan and stir in the garlic and salt. Place the bowl over the pan, making sure the base doesn’t touch the water. Stir until it reaches body temperature and has the consistency of lightly whipped double cream. Turn off the heat, leaving the bowl over the pan.",
      "Melt the butter gently in a seperate small saucepan until it is just beginning to turn hazelnut-brown. Turn the heat off, then stir in the oil, followed by the Aleppo pepper and set aside.",
      "Fill a wide, lidded saucepan with 4cm/1½in water and place over a medium heat. Line a large plate with kitchen paper.",
      "Crack the first egg into a small fine mesh strainer suspended over a small bowl, then lift up and swirl gently for about 30 seconds, letting the watery part of the white drip into the bowl; discard. Gently tip the egg into a small cup or ramekin and pour 1 teaspoon of lemon juice onto it, aiming for the white. Repeat with the second egg.",
      "When the poaching water is just starting to simmer, gently slide in the eggs, one on each side of the pan. Turn the heat right down so there is no movement in the water, and poach the eggs for 3–4 minutes, until the whites are set and the yolks still runny. Transfer the eggs to the lined plate using a slotted spoon.",
      "Divide the warm, creamy yoghurt between two shallow bowls, top each with a poached egg, pour over the peppery butter, scatter the chopped dill on top and eat with the toast."],
      cuisine_type: "Meditteranian",
      description: "If I hadn’t eaten the Turkish eggs at Peter Gordon’s restaurant, I most certainly wouldn’t be tempted by the idea of poached eggs on Greek yoghurt. I say that only to pre-empt any hesitancy on your part. For çilbir, pronounced “chulburr”, is a revelation and a complete sensation.",
      utensils: "None",
      dietary_restrictions: "Dairy",
      recipe_hashtags: ["mediterranian", "turkish", "breakfast", "brunch", "chili", "yoghurt"],
      cook_time: 30,
      user: user,
      video_link: "https://www.youtube.com/embed/XZ1Rd5HOEK4?si=nu_O-GXW2z25oK41",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_NigellaLawson.webp")["url"]), filename: "Recipe_NigellaLawson.webp")
    recipe.save!
  end

# 3 Halfbakedharvest - Chipotle Chicken Tacos

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "halfbakedharvest",
    bio: "The recipes you’ll find here are inspired by the people and places I love most. I come from a family of ten, and a big family means BIG meals. In an effort to tame some of our mealtime chaos and get dinner on the table at a respectable hour, I began to help cook. I soon realized how much I enjoyed it, and before I knew it, I had taken over cooking our meals full-time. I captured the process in photos and documented my best recipes, and that’s how Half Baked Harvest was born.",
    instagram: "https://www.instagram.com/halfbakedharvest",
    youtube: "https://www.youtube.com/channel/UCAavPs6fs6GrvbGiE80xGDQ",
    creator: true
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_HalfBakedHarvest.jpg")["url"]), filename: "Profile_HalfBakedHarvest.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Chipotle Steak Tacos",
      ingredients: ["For the taco filling:", "2 tablespoons extra virgin olive oil", "1 pound ground chicken, beef, or turkey", "1 yellow onion, chopped", "2-3 teaspoons chipotle chili powder, use to your taste", "2 teaspoons smoked paprika", "1 1/2 teaspoons ground cumin", "1 teaspoon garlic powder", "1/4-1/2 teaspoon crushed red pepper, use to your taste", "1/2 teaspoon dried oregano", "1 teaspoon kosher salt", "1/4 cup fresh cilantro, chopped", "12 hard shell tacos", "2 cups shredded Mexican cheese", "For the Cilantro Lime Ranch", "1 cup sour cream or plain Greek yogurt", "3/4 cup fresh cilantro, finely chopped", "1 teaspoon garlic powder", "1 teaspoon onion powder", "1/4 cup pickled jalapeños, chopped + 2 tablespoons brine", "juice from 2 limes", "1 teaspoon kosher salt"],
      method: ["Preheat the oven to 425 degrees F.", "In a large skillet, heat the olive oil over high heat. When the oil shimmers, add the ground chicken and onion. Cook, breaking up the meat as it cooks, until the chicken is browned, about 5 minutes. Add the chipotle chili powder, paprika, cumin, garlic powder, red pepper flakes, oregano, and salt. Add 3/4 cup water. Reduce the heat to medium and simmer until the sauce has thickened slightly around the chicken, about 10 minutes. Remove from the heat and stir in the cilantro.", "Line the taco shells up on a sheet pan or in a 9x13 inch baking dish. Transfer to the oven and bake 5 minutes. Evenly divide the meat among each taco shell and top with cheese. Bake 10 minutes, until the cheese has melted.", "Meanwhile, make the ranch. Combine all ingredients in a glass jar and shake or stir until creamy.", "Serve the tacos topped with ranch, avocado, red onion, and any other desired toppings."],
      cuisine_type: "Mexican",
      description: "Weeknight style Cheesy Baked Crispy Chipotle Chicken Tacos with Cilantro Lime Ranch…and all the toppings. Because loaded tacos are just better. Ground chicken seasoned with a smoky chipotle chili spice mix, stuffed into hard shell tacos, topped with cheese, and oven-baked. These tacos are crunchy on the outside, but spicy and cheesy inside. Serve each taco with a creamy, cooling cilantro lime ranch sauce, and a mix of your favorite taco toppings. They come together in minutes and are so delicious…the perfect weeknight dinner. Bonus, the chipotle chicken is great as a leftover. Pile it high onto your favorite tortilla chips for some seriously delicious nachos or serve it up atop greens for a Mexican inspired salad.",
      utensils: "None",
      dietary_restrictions: "Meat",
      recipe_hashtags: ["mexican", "american", "tacos", "salsa"],
      cook_time: 25,
      user: user,
      video_link: "https://www.youtube.com/embed/LI4D8P1_A-A?si=hMaIjpK-RIwGE78Z",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_HalfbakedHarvest.jpg")["url"]), filename: "Recipe_HalfbakedHarvest.jpg")
    recipe.save!
  end

# 4 ADIP - Dijon Mustard Roast Chicken & Smokey Aubergine Katsu

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "Another Day In Paradise",
    bio: "I'm a chef & photographer. Here to inspure you to cook more & enjoy food.",
    social: "https://www.instagram.com/adip_food",
    youtube: "https://www.youtube.com/@adipfood",
    creator: true
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_ADIP.jpg")["url"]), filename: "Profile_ADIP.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Dijon Mustard Chicken",
      ingredients: ["1 medium chicken", "Maris piper or russet potatoes (enough to cover your sheet pan)", "1 head garlic (you can use the roasted garlic afterwards)", "100g Dijon mustard", "1 lemon", "1 bundle thyme", "Olive oil", "Black Pepper", "Salt", "For the Toum:", "160g peeled garlic", "500ml rapeseed oil (or your preferred oil)", "100ml fresh lemon juice", "Salt"],
      method: ["Salt the chicken before adding the Dijon mustard and olive oil. Rub all over the entire surface and cavity. Leave to rest in the fridge for 2-3 hours or overnight for the best results.",
      "Finely slice the potatoes with a mandolin or a sharp knife - leave to rest in cold water for one hour. Drain well before coating with olive oil and salt.",
      "Evenly spread the potatoes over a sheet tray before adding a little bit more olive oil, salt and pepper to the top.",
      "Place the chicken on the wire rack above the potatoes. Roast at 145c/300f  for one hour. Roast for a further 15-30 minutes at 200c/400f. Rest for 10 minutes.",
      "For the toum.", "Blend the garlic in a food processor making sure to scrape down the sides as you go. Add salt and keep blending and scraping.",
      "You want to make it as close to a paste as possible. The more garlic you use the easier it is.",
      "Add one tsp of lemon juice before starting to slowly stream in the oil, alternating between the lemon juice and oil until you have a thick sauce. If it breaks or isn’t thick enough you can use chickpea water to thicken it."],
      cuisine_type: "European",
      description: "I posted this recipe in 2023 and when I opened Instagram the following day it had a million views and had more than quadrupled my followers. It sort of changed my life, so when I make it I always feel a lot of love. Now I’m back at the beginning again with this long form YouTube channel, I thought it deserved a spot early doors. I don’t know what’s better - the chicken or the potatoes - let me know what you think.",
      utensils: "None",
      dietary_restrictions: "Chicken",
      recipe_hashtags: ["European", "French", "Chicken", "Dijon"],
      cook_time: 60,
      user: user,
      video_link: "https://www.youtube.com/embed/NuCoZ9df2Ac?si=n0pNwlpt9q3-sV4q",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_ADIP.png")["url"]), filename: "Recipe_ADIP.png")
    recipe.save!

    recipe = Recipe.new(
      title: "Smokey Aubergine Katsu",
      ingredients: ["1 aubergine/eggplant", "1/2 cup panko bread crumbs", "1/2 cup all purpose flour", "1 egg", "1/4 head white cabbage", "1 tbsp soy sauce", "1 tbsp Worcestershire sauce ", "4 tbsp ketchup", "oil for frying - I used rapeseed"],
      method: ["Poke a few holes in the aubergine with the tip of your knife before cooking straight over an open flame or under a grill/broiler for about 10-15 minutes, making sure it's blackened all over and soft inside. Place them in a bowl and cover with plastic wrap to gently steam until they have cooled down.",
      "Shave the cabbage on a mandolin then submerge in cold water. This gives the cabbage its signature height and texture once it is piled up. I left mine in the water as long as it took me to put the rest together - about 10-15 minutes.",
      "Once the aubergine has cooled but is still warm you can begin to peel the charred skin. You can use a paper towel to wipe off the excess burnt skin. Use a fork to press out the flesh into a flat shape without breaking it. Season both sides with salt.",
      "Coat the aubergine in flour, then egg, and finally panko breadcrumbs. Fry at 175c for about 2-3 minutes on each side or until golden brown. Leave to drain on a wire wrack while you prepare the sauce.",
      "You can use Bulldog Tonkatsu sauce or simply mix the soy, Worcestershire, and ketchup together over a low heat until combined.",
      "Either put the sauce on the bottom of your plate or spoon it over the top - I prefer it over the top because you get crispy with soft and chewy. Enjoy with the cold crispy cabbage and little lemon."],
      cuisine_type: "Asian",
      description: "I used this technique on a recipe for eggplant/aubergine parm a few months back and shared it on my instagram @adip_food . It got a lot of love and I've been thinking about turning it into Katsu since which adds an amazing smokey flavour and beautiful texture. Let me know if you try it.",
      utensils: "None",
      dietary_restrictions: "Chicken",
      recipe_hashtags: ["Asian", "Eggplant", "Curry", "Tonkatsu"],
      cook_time: 60,
      user: user,
      video_link: "https://www.youtube.com/embed/Nnfy-r_eFcI?si=Hj-Xr5djAPppIGuY"
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe2_ADIP.png")["url"]), filename: "Recipe2_ADIP.png")
    recipe.save!
  end


# 5 Donaldo Cooks - Perfectly Crispy Air Fryer Chicken

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "donaldo_cooks",
    bio: "home cook, and a dad.  Making dinner should be easy",
    instagram: "https://www.instagram.com/donaldo_cooks",
    youtube: "https://www.youtube.com/@donaldo_cooks",
    creator: true,
    avatar_link: "https://res.cloudinary.com/dmj0udbma/image/upload/v1743250276/Profile_Donaldo_tjbqg8.jpg"
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_Donaldo.jpg")["url"]), filename: "Profile_Donaldo.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Crispy AirFryer Chicken",
      ingredients: ["boneless, skinless chicken breasts or thighs", "1 ½ cups cornflakes, crushed", "2 eggs", "1 cup flour (optional add seasoning to flour)", "Cooking spray or oil (for spraying)"],
      method: ["Prepare the chicken:",
      "Trim any excess fat from the chicken breasts or thighs. If using large chicken breasts, consider cutting them in half to ensure they cook evenly.",
      "Set up breading stations:",
      "In one shallow bowl, whisk together the egg.",
      "In another shallow bowl, combine the crushed cornflakes",
      "In another bowl add the Flour",
      "Bread the chicken:",
      "Dip each piece of chicken flour then the egg",
      "Then, press the chicken into the cornflake mixture, making sure it's well-coated on all sides. Gently press the cornflakes onto the chicken to stick.",
      "Preheat the air fryer to 385°F (196.1°C) for about 5 minutes.",
      "Cook the chicken:",
      "Lightly spray the air fryer basket with cooking spray or brush with a bit of oil.",
      "Place the breaded chicken pieces in the air fryer basket in a single layer, leaving space between each piece.",
      "Spray the top of the chicken with a light coat of cooking spray to help it crisp up.",
      "Cook at 385°F for 15-20 minutes, flipping halfway through, until the chicken is golden brown and reaches an internal temperature of 165°F (74°C).",
      "Serve;",
      "Once done, remove the chicken from the air fryer and let it rest for a few minutes.",
      "Serve with your favorite dipping sauce or alongside some veggies! Enjoy your crispy, crunchy cornflake chicken, made effortlessly in the air fryer!"],
      cuisine_type: "American",
      description: "Boost your kitchen game with this crispy, juicy air fryer chicken recipe! Quick, healthy, and packed with flavor ",
      utensils: "AirFryer",
      dietary_restrictions: "Chicken",
      recipe_hashtags: ["airfryer", "american", "chicken", "crunchy"],
      cook_time: 60,
      user: user,
      video_link: "https://www.youtube.com/embed/3s5EsOUOg_U?si=1XCp5cpLcHsx5Z9O",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_Donaldo.png")["url"]), filename: "Recipe_Donaldo.png")
    recipe.save!
  end

# 6 Chef Billy Parisi - Short Rib Ragu & Peruvian Chicken

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "Chef Billy Parisi",
    bio: "Classical culinary expertise meets home cooking! I’m Billy Parisi, a classically trained culinary school graduate from Scottsdale Culinary Institute with over 15 years in the restaurant industry and over 25 years of cooking experience. ",
    instagram: "https://www.instagram.com/chefbillyparisi",
    youtube: "https://www.youtube.com/@ChefBillyParisi",
    creator: true,
    avatar_link: "https://res.cloudinary.com/dmj0udbma/image/upload/v1743250275/Profile_ChefBilly_writpp.jpg"
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_ChefBilly.jpg")["url"]), filename: "Profile_ChefBilly.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Short Rib Ragu",
      ingredients: ["4 ounces medium-diced pancetta, about ½ cup", "3 pounds bone-in short ribs", "1 large, small-diced yellow onion, about 2 cups", "3 peeled medium-sized small diced carrots", "3 small diced ribs of celery", "8 smashed garlic cloves", "2 tablespoons tomato paste", "2 cups dry red wine", "28 ounces tomato puree", "3 cups beef stock", "2 fresh rosemary sprigs", "2-4 fresh thyme sprigs", "2-4 fresh parsley sprigs", "2 bay leaves", "coarse salt and fresh cracked pepper to taste"],
      method: ["Crisp the pancetta: I cook the pancetta in a large rondeau pot over low to medium heat, letting it slowly render its fat until it’s crispy. Once it’s ready, I scoop out the lardons and set them aside, making sure to keep all that flavorful fat in the pot.","Prep the short ribs: I pat dry the short ribs on all sides and then season with salt and pepper.",
      "Sear the short ribs: I place the short ribs into the pot fat cap side down and cook over medium heat and brown well on all sides, which takes about 3 to 4 minutes per side. Then, I set them to the side.",
      "Sauté the onions: I stir in the onions, gently season with salt, and cook for 5 minutes or until they start to turn brown. Then, I turn the heat down to low and cook for 10 minutes while occasionally stirring.",
      "Soften the veggies: I stir in the carrots and celery, making sure they’re well coated in all those flavorful juices. Then, I cover the pot with a lid and let them sweat over low heat for 10 minutes.",
      "Add the garlic: I toss in the garlic and cook just until fragrant, which takes 30 to 45 seconds.",
      "Cook the tomato paste: I stir in the tomato paste and cook for 2 to 3 minutes or until it turns a rust color.",
      "Deglaze the pot: I pour in the red wine, scraping up all those flavorful browned bits from the bottom of the pot. Then, I let it simmer over medium heat for 5 to 7 minutes, to reduce and concentrate the wine flavors.",
      "Build the sauce: I pour in the tomato puree and beef stock, then add the fresh herbs, crispy pancetta, salt, and pepper. I give everything a good stir, letting the flavors meld together into a rich, hearty base for the short ribs to braise in.",
      "Braise the short ribs: I place in the short ribs, add on a lid and cook over low heat for 2 ½ to 3 hours or until the beef is fork tender.",
      "Shred the beef: I remove the herbs and bones from the short ribs in pan. Then, I break up the beef in the sauce using two forks or a large spoon.",
      "Finish and serve: I sprinkle finely minced fresh parsley on top for a burst of freshness. Then, I toss it with pasta or serve it over creamy polenta, either way, it’s absolutely delicious!"],
      cuisine_type: "Italian",
      description: "Short rib ragu, or ragù di cossolette di manzo in Italian, is a classic sauce recipe for braised short ribs in a flavorful tomato and beef stock liquid with herbs and vegetables. The result is a fork-tender meat sauce that is incredibly flavorful.",
      utensils: "None",
      dietary_restrictions: "Beef",
      recipe_hashtags: ["Beef", "Ragu", "Italian", "Wine"],
      cook_time: 300,
      user: user,
      video_link: "https://www.youtube.com/embed/E-YsHfmBrTM?si=78giClAiY15Gsy_3",
      image_link: "https://res.cloudinary.com/dmj0udbma/image/upload/v1743250278/Recipe_ChefBilly_b9e1kb.png"
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_ChefBilly.png")["url"]), filename: "Recipe_ChefBilly.png")
    recipe.save!

    recipe = Recipe.new(
      title: "Peruvian Chicken",
      ingredients: ["1 whole chicken", "1 tsp cumin seeds", "1 tsp coriander seeds", "12 garlic cloves", "1/2” peeled hunk of fresh ginger", "1 tablespoon finely minced fresh rosemary", "1 tablespoon huacatay", "1 ½ tablespoons aji panca", "3 tablespoons soy sauce", "3 tablespoons red wine vinegar", "¼ cup olive oil", "coarse salt and fresh cracked pepper to taste"],
      method: ["Toast: I add the seeds to a medium-sized sauté pan and cook them over low to medium heat, stirring occasionally until they’re fragrant.",
      "Grind: Then, I transfer the toasted seeds to a mortar and pestle and grind them until they’re finely ground.",
      "Add: After grinding the seeds, I toss in the garlic and ginger, then start working everything together with the pestle until it’s well blended.",
      "Mix: In go the rosemary, huacatay, vinegar, soy sauce, oil, and aji panca. I mix it all together until it’s fully combined, then give it a taste and adjust with a little salt and pepper as needed.",
      "Substitute huacatay: If I don’t have huacatay, I grind three to four large fresh mint leaves instead. They bring a similar brightness to the marinade.",
      "Replace aji panca: When I don’t have aji panca, I use one dried ancho chili. I start by removing the stem and seeds to get it ready for toasting.",
      "Toast: I place the chili in a small pan and cook it on the middle rack at 275 degrees for about 15 to 20 minutes. Once it cools slightly, it goes straight into the mortar and pestle to be ground up with the rest of the ingredients.",
      "Prep the chicken: I rinse it thoroughly, pat it dry with paper towels, and place it in a large bowl.",
      "Marinate: Most of the marinade goes right over the chicken, with just a few tablespoons set aside for later. I make sure it’s well coated and ready to soak in all that flavor.",
      "Coat: Working the marinade into every part of the chicken, I make sure to get inside the cavity, under the skin, and all over the outside for even flavor throughout.",
      "Chill: Once it’s fully coated, I cover the bowl and place it in the fridge, letting it marinate anywhere from 12 to 72 hours so the flavors really settle in.",
      "Truss: I tuck the wings behind the chicken and tie the legs together with butcher’s twine to help it cook evenly and hold its shape in the oven.",
      "Set: The chicken goes on a rack inside a roasting pan, then I pour in two cups of water or chicken stock to keep things moist while it cooks.",
      "Bake: I place the pan on the middle rack of a preheated 400-degree oven and let it roast for about 70 to 75 minutes, until the skin is well browned and the chicken is cooked all the way through.",
      "Grill Option: Another way I like to cook it is by heating one side of the grill over high heat, then setting the pan with the chicken on the cooler side where there’s no direct heat underneath. I let it cook there for the same time and temperature as in the oven.",
      "Rest: Once it’s out of the oven or off the grill, I let the chicken rest uncovered so the juices settle and the skin stays crisp.",
      "Finish: Just before serving, I brush the chicken with the reserved marinade to bring back a fresh layer of flavor.",
      "Serve: I like to plate it up with a generous side of Aji Verde, the classic Peruvian green sauce that really ties everything together."],
      cuisine_type: "Peruvian",
      description: "My popular Peruvian Chicken, known as Pollo a la Brasa, is marinated overnight with spices, herbs, and soy sauce, then roasted until the skin is crisp and the meat is full of flavor. Once you try it alongside my homemade Aji Verde sauce, you’ll see why this dish keeps showing up in my kitchen.",
      utensils: "None",
      dietary_restrictions: "Chicken",
      recipe_hashtags: ["Chicken", "Peruvian"],
      cook_time: 120,
      user: user,
      video_link: "https://www.youtube.com/embed/rhIHkDY8zDk?si=3P9flz1ze41WOooc"
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe2_ChefBilly.png")["url"]), filename: "Recipe2_ChefBilly.png")
    recipe.save!
  end


# 7 Foodie Diaries - Coconut Lime Tofu

  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "The Foodie Diaries",
    bio: "A curated collection of recipes & recommendations across food and travel. You’ll find plenty of Kitchen Inspiration here including pantry picks, tips and tricks. Explore new destinations through our detailed travel guides; and discover a treasure trove of resources for navigating pregnancy and motherhood.",
    instagram: "https://www.instagram.com/the_foodiediaries",
    youtube: "https://www.youtube.com/@the_foodiediaries",
    creator: true
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_FoodieDiaries.png")["url"]), filename: "Profile_FoodieDiaries.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Coconut Lime Tofu",
      ingredients: ["For the red curry paste", "9-10  dried red chillies (you can use Kashimiri chillies)", "3-4 cloves garlic cloves", "4-5 kaffir lime leaves", "1 inch galangal/ ginger", "2 lemongrass stalks (each about 2 inches tall), finely chopped", "1 medium-sized onion", "½ tsp coriander powder", "½ tsp cumin powder", "pinch of white or black peppercorns", "salt to taste"],
      method: ["For the red curry paste",
      "Deseed the red chillies before soaking them in warm water for 15 minutes. Drain, reserving 1-2 tbsp of the water.",
      "Start by blitzing the onion into a wettish paste. Doing so separately , gives us the moisture we need to blend the remaining ingredients into a smooth paste.",
      "Now add the red chillies along with the remaining ingredients for the curry paste, adding 1 tbsp of the reserved water if required. Blend until smooth and your homemade red curry paste is ready!",
      "Prep & cook the tofu", "Wrap a block of silken-firm tofu between kitchen towels and place something heavy on top to drain out the excess water. Let it sit for about 10-15 minutes, then pat it dry and slice it up.",
      "Optional: for an extra crisp texture, coat the tofu slices in a bit of cornflour.",
      "In a pan, heat up some oil and pan-fry the tofu until it’s golden on both sides, flipping halfway through. Once it’s done, remove it and set it aside.",
      "Prep the coconut sauce",
      "In the same pan, add a little more oil along with some sliced onion, minced garlic, and grated ginger.",
      "Stir until fragrant, then add in a red curry paste and a splash of hot sauce. The aroma will be irresistible at this point!",
      "Next, pour in some coconut milk, followed by a bit of soy sauce, brown sugar, and a squeeze of lemon juice to balance all those flavors.",
      "Let the curry simmer for a few minutes until it thickens slightly and develops a deeper flavour.",
      "Assemble your coconut lime tofu",
      "Add the crispy tofu back into the pan, stirring until it is well-combined with the rich and creamy coconut curry.",
      "To finish, garnish with scallions and sesame seeds.",
      "Serve with rice and dive into the most deliciously-cosy meal you’ve had yet!"],
      cuisine_type: "Asian, Fusion, Thai",
      description: "This coconut lime tofu is a creamy yet slightly spicy and oh-so-zingy dish, perfect for those nights when you want a quick and delicious one-pan dinner, without the wait! It’s quite possibly my favourite recipe from my “15 in 15” series, sharing quick dinner fixes that come together in under fifteen minutes!",
      utensils: "None",
      dietary_restrictions: "Beef",
      recipe_hashtags: ["Tofu", "Indian", "Curry", "Vegan"],
      cook_time: 15,
      user: user,
      video_link: "https://videopress.com/embed/MuAQjUBG",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_FoodieDiaries.jpg")["url"]), filename: "Recipe_FoodieDiaries.jpg")
    recipe.save!
  end

# 8 Munchies - Chicken Tikka Masala
    user = User.new(
      email:  Faker::Internet.email,
      password: "123456",
      user_name: "Munchies",
      bio: "A curated collection of recipes & recommendations across food and travel. You’ll find plenty of Kitchen Inspiration here including pantry picks, tips and tricks. Explore new destinations through our detailed travel guides; and discover a treasure trove of resources for navigating pregnancy and motherhood.",
      instagram: "https://www.instagram.com/munchies",
      youtube: "https://www.youtube.com/Munchies",
      creator: true
    )
    user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_Munchies.png")["url"]), filename: "Profile_Munchies.png")
    user.save!

    if user.persisted?

      recipe = Recipe.new(
        title: "Chicken Tikka Masala",
        ingredients: ["For the chicken tikka:",
        "2 pounds|916 grams boneless, skinless chicken thighs", "1 tablespoon kosher salt", "1 tablespoon red chili powder", "6 garlic cloves, peeled and mashed into a paste", "1 (1-inch) piece ginger, peeled and mashed into a paste", "2 lemons, juiced", "1 cup|225 grams plain yogurt", "¼ cup|60 ml canola oil", "1 tablespoon garam masala", "2 teaspoons ground turmeric", "2 tablespoons unsalted butter, melted",
        "For the makhni gravy:",
        "1 pound|450 grams tomatoes, halved", "1 garlic clove, peeled and mashed into a paste", "1 (½-inch) piece ginger, peeled and mashed into a paste", "1 teaspoon red chilli powder", "1 small green chilli", "1 cardamom pod", "1 whole clove", "15 grams cilantro with stems", "kosher salt, to taste", "½ tablespoon unsalted butter", "¼ cup|60ml heavy cream", "2 tablespoons kasoori methi", "honey, to taste",
        "for the onion tomato masala:",
        "¼ cup|60 ml canola oil", "½ pound red onion, diced", "2 garlic cloves, peeled and mashed into a paste", "1 (¾-inch) piece ginger, peeled and mashed into a paste", "½ teaspoon red chili powder", "½ pound|225 grams tomatoes, diced", "½ teaspoon garam masala", "kosher salt, to taste",
        "For the chicken tikka masala:",
        "3 tablespoons|150 grams ghee", "3 teaspoons cumin seeds", "8 whole dried red chiles", "7 small garlic cloves, chopped", "2 pounds|1 kg chicken tikka", "2 teaspoons red chilli powder", "1 ¼ cups onion tomato masala", "1 ¼ cups makhni gravy", "5 green chillies, thinly sliced", "¼ cup|60 ml heavy cream", "1 tablespoon unsalted butter", "2 tablespoons kasoori methi", "1 tablespoon garam masala", "kosher salt, to taste",
        "chopped cilantro, for garnish",
        "1 (1-inch) piece ginger, peeled and julienned, for garnish",
        "steamed basmati rice, to serve"],
        method: ["Marinate the chicken: Place the chicken in a large bowl and toss with the salt, 1 teaspoon of the chili powder, half of the garlic paste, the  lemon juice, and half of the ginger paste. Let the chicken sit at room temperature for 10 minutes.",
        "In a medium bowl, whisk together the remaining chili powder and garlic and ginger pastes with the yogurt, canola oil, garam masala, and turmeric. Toss in the chicken to coat, then cover and refrigerate for at least 6 hours, preferably overnight.",
        "Heat the oven to 350°F. Grease a rack fitted in a sheet tray with the butter and place the chicken on the tray. Bake until the chicken is cooked through, about 13 minutes. Let the chicken cool slightly, then cut into 2-inch pieces and reserve.",
        "Make the gravy: Place the tomatoes, garlic and ginger pastes, and half of the chili powder into a small saucepan and cover with 1 ½ cups water. Place the green chiles, cardamom, cloves, and cilantro stems in a piece of cheesecloth, tie it at the top, and add it to the saucepan. Bring the mixture to a boil over high, then reduce the heat to maintain a simmer and cook until the sauce has reduced slightly, about 45 minutes.",
        "Let the sauce cool slightly, then discard the cheesecloth. Transfer the sauce to the bowl of a blender or food processor and puree until smooth. Return it to the saucepan and bring to a boil. Reduce the heat to maintain a simmer and cook until thick, about 12 minutes. Add the remaining red chili powder, the butter, cream, and kasoori methi. If the sauce tastes sour, add honey to taste.",
        "Make the onion tomato masala: Heat the oil in a medium skillet over medium-high. Add the onions and cook until golden, about 10 minutes. Add the garlic and ginger pastes and the chili powder and lower the heat to medium-low. Cook 8 minutes, then stir in the tomatoes. Cook until the tomatoes are soft and dark and the oil has emerged on the surface of the masala, about 3 minutes. Stir in the garam masala and season with salt.",
        "Heat the ghee in a large saucepan over medium-high. Add the cumin seeds and dried whole chiles and cook until they start to crackle, about 1 minute. Add the garlic and cook until golden, about 1 minutes. Add the chicken and cook for 1 minute, then add the chili powder. Add the onion tomato masala, the gravy, and the green chiles and bring to a boil. Reduce the heat to maintain a simmer and cook until the chicken is heated through, about 2 minutes. Stir in the cream, butter, garam masala, and kasoori methi and season with salt. Serve with steamed basmati rice and garnish with the chopped cilantro and ginger."],
        cuisine_type: "Asian, Fusion, Indian",
        description: "This coconut lime tofu is a creamy yet slightly spicy and oh-so-zingy dish, perfect for those nights when you want a quick and delicious one-pan dinner, without the wait! It’s quite possibly my favourite recipe from my “15 in 15” series, sharing quick dinner fixes that come together in under fifteen minutes!",
        utensils: "None",
        dietary_restrictions: "Beef",
        recipe_hashtags: ["Chicken", "Tikka Masala", "Curry", "Indian"],
        cook_time: 180,
        user: user,
        video_link: "https://www.youtube.com/embed/ht5myyg8Y3k?si=-VbfYlgXyWwsUC-J",
      )
      recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_Munchies.webp")["url"]), filename: "Recipe_Munchies.webp")
      recipe.save!
    end
# 9 The Mediterranian Dish - Turkish Meatballs - This Recipe has Timestamps on Youtube!
    user = User.new(
      email:  Faker::Internet.email,
      password: "123456",
      user_name: "The Mediterranian Dish",
      bio: "Mediterranean Food & Diet | Easy Recipes | Suzy Karadsheh
      2 X New York Times Bestselling Author. Leading online resource for easy Mediterranean recipes + Mediterranean diet for home cooks.",
      instagram: "https://www.instagram.com/themediterraneandish/",
      youtube: "https://www.youtube.com/@TheMediterraneanDish",
      creator: true
    )
    user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_TheMediterranianDish.jpg")["url"]), filename: "Profile_TheMediterranianDish.jpg")
    user.save!

    if user.persisted?

      recipe = Recipe.new(
        title: "Kofta Meatballs",
        ingredients: ["Extra virgin olive oil", "1 slice of bread, toasted", "1 pound ground beef or lamb", "1 medium yellow onion, quartered", "2 garlic cloves", "1 whole bunch parsley, stems removed (about 2 packed cups of leaves)", "1 1/2 teaspoons allspice", "1/2 teaspoon ground green cardamom", "1/2 teaspoon paprika", "1/2 teaspoon sumac", "1/2 teaspoon ground nutmeg", "1/4 teaspoon cayenne", "Kosher salt", "Black pepper", "1/4 cup pine nuts", "1/4 teaspoon Aleppo pepper", "10 ounces hummus (about 1 cup)",
        "Pita bread, for serving (optional)"],
        method: ["Get ready. Heat your oven to 425°F. Lightly brush a large sheet pan with a thin layer of olive oil.", "Soak the bread until very tender. In a large bowl cover the bread with 1 cup of water. Let it sit for 15 minutes.", "Prepare the fresh seasonings. While the bread soaks, add the onion, garlic, and parsley (set aside a small handful of leaves for garnish) to a food processor and pulse until they are finely minced. You can also do this by hand if you'd like, just make sure everything is very finely chopped.", "Crumble the bread. Use your hands to squeeze the liquid out of the bread. Discard the water and crumble the bread slice back into the bowl. This is the secret to a juicy meatball!", "Make the meatball mixture. Into the bowl with the bread, add a good drizzle of olive oil, the onion and garlic mixture, ground meat, allspice, cardamom, paprika, sumac, nutmeg, cayenne, and a big pinch each of kosher salt and pepper. Use your hands to mix it all together, making sure everything is well combined.", "Roll the meatballs. Form the meat mixture into small balls, just slightly larger than the size of a golf ball. Arrange them on the prepared sheet pan without touching.", "Bake the meatballs. Place in the oven and bake, turning over halfway through, until the meatballs are well browned and the center is no longer pink, 20 to 25 minutes.", "Toast the pine nuts. While the meatballs roast, set a small skillet over medium-low heat. Add enough olive oil to coat the bottom of the skillet and the pine nuts. Toast, stirring, until they are fragrant and golden. Stay close by and stir constantly so they don’t burn. Transfer to a small plate.", "Make the sizzled Aleppo oil. A few minutes before the meatballs have cooked through, return the skillet where you toasted the pine nuts to medium heat. Add the 1/4 cup of olive oil and the Aleppo pepper. You just want to warm and flavor the oil. This should only take a few minutes. Turn off the heat.", "Assemble. Remove the meatballs from the oven. Spread hummus on a plate or platter, using a spoon to make swoops and swirls. Pour the warmed oil over the hummus and top with meatballs. Garnish with the toasted pine nuts and reserved parsley leaves. Serve with pita bread on the side."],
        cuisine_type: "Middle Eastern, Mediterranian",
        description: "Meatballs, Middle Eastern Style! Weeknight-friendly baked meatballs recipe with ground beef or lamb seasoned with Middle Eastern spices and baked in the oven until golden brown and juicy. Serve these meatballs over a bed of creamy hummus with a drizzle of olive oil and toasted pine nuts!",
        utensils: "None",
        dietary_restrictions: "Meat, Nuts, Dairy",
        recipe_hashtags: ["Beef", "Lamb", "Nuts", "Mediterranian", "Middle Eastern"],
        cook_time: 50,
        user: user,
        video_link: "https://www.youtube.com/embed/CZTnQAspJDc?si=DQM9LrWl2WqyPiBX",
      )
      recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_TurkishMeatballs.png")["url"]), filename: "Recipe_TurkishMeatballs.png")
      recipe.save!
    end
# 10 Just One Cookbook - Vegetarian Ramen
  user = User.new(
    email:  Faker::Internet.email,
    password: "123456",
    user_name: "Just One Cookbook",
    bio: "Whether you’re passionate about Japanese cuisine or simply eager to expand your kitchen skills, Just One Cookbook is your trusted guide to authentic Japanese home cooking and food culture.",
    instagram: "https://www.instagram.com/justonecookbook/",
    youtube: "https://www.youtube.com/@justonecookbook",
    creator: true
  )
  user.avatar.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Profile_JustOneCookbook.jpg")["url"]), filename: "Profile_JustOneCookbook.jpg")
  user.save!

  if user.persisted?

    recipe = Recipe.new(
      title: "Vegetarian Ramen",
      ingredients: ["For the Soup Broth",
      "2 Tbsp toasted white sesame seeds", "1½ tsp ginger (grated; from a 1-inch, 2.5-cm knob)", "2 cloves garlic", "2 green onions/scallions (save the green part for garnish)", "1 Tbsp toasted sesame oil", "1½ Tbsp doubanjiang (spicy chili bean paste) (use either the spicy or non-spicy type, or use gluten-free doubanjiang)", "1½ Tbsp miso (I use my favorite miso by Hikari Miso; most types will work, except Saikyo and Hatcho varieties)", "1 Tbsp sake", "1½ Tbsp soy sauce (use GF soy sauce for gluten-free)", "2 cups unsweetened soy milk", "1 cup Vegan Dashi (use my Vegan Dashi recipe or follow the instructions below)", "½ tsp Diamond Crystal kosher salt", "1 dash of white pepper powder",
      "For the Ramen",
      "2 servings fresh ramen noodles (10–12 oz, 283–340 g fresh noodles; 6.3 oz, 180 g dry ramen noodles; use GF ramen noodles for gluten-free)",
      "1 head Shanghai bok choy (large)",
      "toppings of your choice (I like to add ramen eggs (skip for vegan), corn, nori seaweed, vegan kimchi, and spicy bean sprout salad; see the instructions for details)"],
      method: ["Gather all the ingredients. If you haven‘t already made the vegan dashi, prepare my Vegan Dashi recipe or follow the instructions below. Make sure all the toppings are ready to go before you begin cooking the ramen. If you‘re making my Ramen Eggs recipe (1 per bowl), prepare them a day in advance. I also like to divide and add ½ cup of my Spicy Bean Sprout Salad and ¼ cup of my friend Seonkyoung‘s homemade vegan kimchi. Finally, ¼ cup corn (frozen or canned) and 1 sheet nori (dried laver seaweed) are other popular toppings to divide among the bowls.",
      "A typical ramen bowl can hold 1200–1400 ml of liquid. We will prepare 1½ cups (360 ml) of soup broth per bowl, which should be more than enough. If you’re using bigger bowls, you may need to prepare extra soup.",
      "To Make the Vegan Dashi",
      "Measure 1 cup (240 ml) of water. Add 1–2 dried shiitake mushrooms (3–5 g each) and 1 piece of kombu (dried kelp) (5 g; 2 x 2 inches, 5 x 5 cm per piece). I set a small heavy cup or bowl on top to keep the mushrooms completely submerged in the water. Soak for at least 30 minutes. Meanwhile, prepare the ramen ingredients. Tip: Use less mushroom if they are thick and large and more if they are flat and small.",
      "After 30 minutes, transfer this cold brew vegan dashi (the liquid, kombu, and shiitake) to a medium saucepan.",
      "Slowly bring it to a near boil over low heat; this slow extraction will enhance the dashi flavor. Right before the liquid boils, remove the kombu and shiitake mushroom from the dashi. Turn off the heat. Tip: If you leave the kombu in the pot, the dashi will become slimy and bitter.",
      "Transfer the vegan dashi to a measuring cup. Make sure you have 1 cup; if not, add water.",
      "Tip: You can repurpose the spent kombu to make Simmered Kombu (Kombu Tsukudani) and Homemade Furikake (Rice Seasoning). Cut off the stem of the spent shiitake mushroom and use the cap just as you would a fresh shiitake mushroom.",
      "Prepare a big pot of water for cooking the bok choy and noodles. Slowly bring it to a boil on medium-low heat while you prepare all the ingredients.",
      "Grind and crush 2 Tbsp toasted white sesame seeds in a Japanese mortar and pestle (suribachi and surikogi)",
      "Grate the ginger (I use a ceramic grater). Reserve 1½ tsp ginger (grated, with juice). If you’re unsure how much ginger flavor you’d like, start with less and add more later.",
      "Next, mince or press 2 cloves garlic",
      "Separate the green and white parts of 2 green onions/scallions. Cut the white part (for the soup broth) into thin rounds.",
      "Then, cut the green part (for the garnish) into thin rounds. Keep them in separate bowls.",
      "Cut 1 head Shanghai bok choy into quarters lengthwise and rinse clean under water. Debris tends to hide between the layers, so rinse them thoroughly.",
      "To Make the Soup Broth",
      "Set a small saucepan over medium-low heat. Add 1 Tbsp toasted sesame oil, the minced garlic, the grated ginger, and the white part of the green onions/scallions. Cook until fragrant, about 1–2 minutes. Tip: Make sure not to burn the aromatics.",
      "Add 1½ Tbsp doubanjiang (spicy chili bean paste) and 1½ Tbsp miso to the saucepan. Stir constantly so that they don’t burn. Tip: Try different miso types to create a slightly different flavor for the soup broth. For information on doubanjiang substitution, see the blog post.",
      "Next, add 1 Tbsp sake and use a wooden spatula to stir and release the bits of the sauce attached to the bottom of the saucepan.",
      "Add the ground sesame seeds and 1½ Tbsp soy sauce and mix it all together.",
      "Gradually add 2 cups unsweetened soy milk, stirring constantly and making sure to dissolve the doubanjiang and miso.",
      "Then, add 1 cup Vegan Dashi.",
      "Taste the soup now and adjust the seasoning with ½ tsp Diamond Crystal kosher salt and 1 dash of white pepper powder, to taste. Don‘t be shy about adding salt because the broth will taste less salty after you add the noodles. Turn off the heat, cover with a lid, and set aside.",
      "Blanch your Pak Choi & place it in a bowl with ice water after to keep it from cooking further",
      "Now, it‘s time to reheat the soup broth until it‘s piping hot, but don‘t let it overboil because it may curdle. Before cooking the fresh noodles, loosen them up with your hands.",
      "When the noodles are done cooking, drain them well in a strainer, shaking it a few times to drain the water thoroughly (otherwise it will dilute the soup broth). Transfer the noodles to the individual ramen bowls.",
      "To Serve: Divide and pour the piping-hot soup broth with seasonings over the noodles. Then, divide and add the bok choy and toppings of your choice to the bowls. I topped this Vegetarian Ramen with 2 ramen eggs sliced lengthwise, ¼ cup frozen or canned corn, 1 sheet nori (dried laver seaweed), ½ cup Spicy Bean Sprout Salad, and ¼ cup vegan kimchi. Garnish with the chopped green onions and serve."],
      cuisine_type: "Japanese, Asian",
      description: "This Vegetarian Ramen is going to rock your world! Learn the secret to creating a super-rich and creamy broth with soy milk, miso, sesame seeds, and spicy chili bean sauce. Make it vegan by skipping the ramen egg!",
      utensils: "None",
      dietary_restrictions: "Vegetarian",
      recipe_hashtags: ["Asian", "Japanese", "Vegetarian", "Noodles", "Ramen", "Soup"],
      cook_time: 60,
      user: user,
      video_link: "https://www.youtube.com/embed/odQoGW7siCc?si=tuwuzSgRv0DUV0vI",
    )
    recipe.image.attach(io: URI.open(Cloudinary::Uploader.upload("public/data_pics/Recipe_JustOneCookbook.png")["url"]), filename: "Recipe_JustOneCookbook.png")
    recipe.save!
  end



puts "Your Foodies & Recipes are ready"


puts "Creating your Foodie Experiences"


# 1 FoodTechniqueBerlin - Ramen
# 2
