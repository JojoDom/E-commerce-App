import 'package:flutter/material.dart';

class FoodsData {
  final String title;
  final String image;
  final String categories;
   int? quantity;
  final String price;
  final String? measuringUnit;
  final Color color;
  final String? description;
  final List<bool> favAndCart;

  FoodsData(
      {required this.title,
      required this.price,
      required this.color,
      this.quantity,
      this.description,
      this.measuringUnit,
      required this.favAndCart,
      required this.image,
      required this.categories});
}

List<FoodsData> fruits = [
  FoodsData(
      color: Colors.red,
      title: 'Apples',
      description:
          "Looking for the perfect snack or ingredient for your next meal?. "
          "Our apples are crisp, flavorful, and bursting with natural sweetness. " 
          " Whether you enjoy them as a healthy on-the-go snack or in your favorite "
          "recipes, our hand-picked apples are the ideal choice. Don't miss out – get your delicious apples today and elevate your culinary experience.",
      image: 'assets/images/trans_apple.png',
      categories: 'FRUITS',
      price: ' GHS 1',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),

  FoodsData(
      title: 'Avocado',
      description: 'Indulge in the creamy, nutritious goodness of our avocados. Each one is handpicked to perfection, ensuring a rich, buttery texture that adds a delightful twist to your dishes. From smashing for guacamole to slicing for salads, our avocados are versatile and bursting with flavor. Elevate your meals with the goodness of avocados – nature\'s superfood. Grab yours today.',
      color: const Color(0xFF568203),
      image: 'assets/images/trans_avocado.png',
      categories: 'FRUITS',
      price: ' GHS 1',
      favAndCart: [false, false],
      measuringUnit: 'kg',
      quantity: 1),
       FoodsData(
      title: 'Pineapple',
      description: 'Experience a burst of sunshine with our ripe and succulent pineapples. Each bite is a tropical delight, sweet and tangy, ready to transport your taste buds to an island getaway. Whether you enjoy them fresh, in fruit salads, or as a refreshing beverage garnish, our pineapples bring a taste of paradise to every dish. Don\'t wait for a vacation to savor the tropics – bring home the sunshine with our delicious pineapples.',
      color: const Color(0xFFFFD700),
      image: 'assets/images/trans_pineapple.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Banana',
      color: Colors.yellow,
      description: 'Discover the natural sweetness of our fresh, ripe bananas. Packed with flavor and loaded with energy, these bananas are the perfect snack or addition to your favorite recipes. Whether you enjoy them as a quick pick-me-up or use them in smoothies, baking, or cereal, our bananas are sure to satisfy your cravings. Don\'t wait – grab a bunch of these nutritious delights today.',
      image: 'assets/images/trans_banana.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Berries',
      color: const Color(0xFFFF0000),
      description: 'Treat yourself to a burst of flavor with our assortment of fresh, hand-picked berries. From luscious strawberries to plump blueberries and everything in between, our berries are a mouthwatering delight. Whether you sprinkle them on your breakfast, blend them into a smoothie, or savor them straight from the container, our berries are the epitome of freshness. Elevate your snacking and cooking game with our exquisite selection – your taste buds will thank you!.',
      image: 'assets/images/trans_berry.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Grapes',
      description: 'Experience the joy of biting into nature\'s candy with our selection of plump, sweet grapes. From succulent red grapes to refreshing green grapes, our variety is a taste sensation. Perfect for snacking, adding to salads, or as a healthy dessert, our grapes are a flavorful delight. Treat yourself and your loved ones to the goodness of our grapes they\'re like sunshine in every bite. Order now and enjoy the deliciousness.',
      color: const Color(0xFF008000),
      image: 'assets/images/trans_grapes.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Mango',
      description: 'Savor the tropical goodness of our ripe and juicy mangoes. Each bite is a burst of sweet, luscious flavor that transports you to paradise. Our mangoes are handpicked at the peak of ripeness to ensure maximum indulgence. Whether you enjoy them sliced, diced, or blended into smoothies, our mangoes are a taste of sunshine in every mouthful. Don\'t miss out on this tropical treat – order your mangoes today and experience the essence of summer.',
      color: const Color(0xFFFFA500),
      image: 'assets/images/trans_mango.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      favAndCart: [false, false],
      measuringUnit: 'kg',
      quantity: 1),
  FoodsData(
      title: 'Orange',
      description: 'Revitalize your day with the bright and tangy flavor of our premium oranges. These citrus gems are bursting with natural juiciness and vitamin C goodness. Whether you peel them for a healthy snack, squeeze them for fresh orange juice, or use them in your culinary creations, our oranges are your ticket to vibrant flavor. Elevate your wellness routine and satisfy your cravings with our delicious, vitamin-packed oranges. Grab a taste of sunshine today.',
      color: const Color(0xFFFFA500),
      image: 'assets/images/trans_orange.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      favAndCart: [false, false],
      measuringUnit: 'kg',
      quantity: 1),
  FoodsData(
      title: 'Watermelon',
      description: 'Stay cool and refreshed with our succulent watermelons. Bursting with juicy, mouthwatering sweetness, our watermelons are the ultimate summer treat. Each slice is a delightful explosion of flavor, perfect for picnics, BBQs, or a quick hydrating snack. Beat the heat with our delicious watermelons – they\'re nature\'s way of saying \'chill out.\' Dive into a slice of paradise today.',
      color: const Color(0xFF228B22),
      image: 'assets/images/trans_watermelon.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      favAndCart: [false, false],
      measuringUnit: 'kg',
      quantity: 1),
];

List<FoodsData> veggies = [
  FoodsData(
      title: 'Beetroot',
      description: 'Add a pop of color and nutrition to your meals with our fresh beetroot. These ruby-red treasures are not only visually stunning but also rich in essential vitamins and minerals. Whether roasted, boiled, or grated into salads, our beetroot elevates your culinary creations. Enhance your health and explore new flavors with this versatile and earthy vegetable. Transform your dishes with the vibrant allure of beetroot – order yours today.',
      color: const Color(0xFF8E354A),
      image: 'assets/images/trans_beetroot.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Bell Pepper',
      description: 'Brighten up your meals with our assortment of bell peppers in every hue of the rainbow. From the sweetness of red to the freshness of green, our peppers add a burst of flavor and vibrant color to your dishes. Whether you stuff them, sauté them, or enjoy them raw, our bell peppers are a kitchen essential. Elevate your cooking with the diversity of colors and flavors – transform ordinary into extraordinary with our bell peppers.',
      color: const Color(0xFFFFA500),
      image: 'assets/images/trans_bell_pepper.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Broccoli',
      description: 'ntroduce health and flavor to your plate with our fresh broccoli florets. These vibrant green gems are not only delicious but also packed with essential nutrients. Whether steamed, stir-fried, or added to your favorite dishes, our broccoli enhances your meals with a satisfying crunch and a burst of freshness. Elevate your cooking and well-being with the versatile and nutritious goodness of broccoli. Fuel your body with the green goodness – order yours today!.',
      color: const Color(0xFF228B22),
      image: 'assets/images/trans_broccoli.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Cabbage',
      description: 'Elevate your meals with our farm-fresh cabbage heads. From coleslaw to stir-fries and hearty soups, cabbage is a versatile addition to your culinary adventures. With its satisfying crunch and mild flavor, our cabbage is the perfect canvas for your favorite recipes. Whether you prefer it raw or cooked, our cabbage heads are ready to bring wholesome goodness to your plate. Experience the crispness – order yours today!.',
      color: const Color(0xFF228B22),
      image: 'assets/images/trans_cabbage.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Carrots',
      description: 'Fuel your body with the vibrant orange goodness of our fresh carrots. Packed with vitamins and natural sweetness, our carrots are the ideal snack or ingredient for your favorite recipes. Whether you enjoy them raw with a dip or use them in soups, salads, and stir-fries, our carrots add a burst of color and nutrition to every dish. Treat yourself to the natural crunch and sweetness – make carrots a part of your daily routine.',
      color: const Color(0xFFFFA500),
      image: 'assets/images/trans_carrots.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Cauliflower',
      description: 'Elevate your meals with our tender cauliflower florets, a blank canvas for culinary creativity. Roast them for a satisfying crunch, mash them for a creamy side, or use them in a variety of dishes. Our cauliflower is ready to add subtle nutty flavors to your recipes while providing essential nutrients. Whether you\'re experimenting in the kitchen or looking for a healthy side, our cauliflower florets are your versatile companion. Discover endless possibilities – order yours today.',
      color: const Color(0xFFFFFFFF),
      image: 'assets/images/trans_cauliflower.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Cucumber',
      color: const Color(0xFF008000),
      description: 'Quench your thirst and invigorate your taste buds with our fresh cucumbers. These crunchy, hydrating wonders are perfect for salads, sandwiches, and snacking. With their refreshing flavor and satisfying crunch, our cucumbers are a must-have for hot summer days or any time you crave a crisp bite. Elevate your dishes with the coolness of cucumbers – they\'re nature\'s way to keep you refreshed and revitalized. Dive into a world of freshness today.',
      image: 'assets/images/trans_cucumber.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
 
  FoodsData(
      title: 'GreenPeas',
      color: const Color(0xFF00FF00),
      image: 'assets/images/trans_greenpeas.png',
      description: 'Delight your taste buds and nourish your body with our fresh green peas. These little green gems are packed with vitamins and fiber, making them the perfect addition to your meals. Whether you love them in creamy soups, as a side dish, or mixed into your favorite recipes, our green peas offer a burst of vibrant color and flavor. Elevate your plate with the wholesome goodness of green peas – they\'re a green dream come true.',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Lemon',
      description: 'Awaken your taste buds with the tangy and citrusy goodness of our lemons. These bright yellow fruits are a kitchen essential, perfect for adding zing to your dishes and beverages. Whether you\'re making homemade lemonade, dressing a salad, or infusing flavor into your recipes, our lemons provide that extra pop of freshness. Elevate your culinary creations with the vibrant flavor of lemons – they\'re nature\'s secret ingredient for a burst of brightness in every bite.',
      color: const Color(0xFFFFFF00),
      image: 'assets/images/trans_lemon.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Lettuce',
      description: 'Elevate your salads, wraps, and sandwiches with our premium lettuce leaves. Each leaf is a crisp and refreshing bite that adds a burst of green goodness to your meals. Whether you\'re looking for the perfect base for your favorite dressings or a nutritious wrap filling, our lettuce leaves are versatile and packed with nutrients. Fuel your body with the crispness and freshness of lettuce – it\'s the foundation of wholesome and delicious creations!.',
      color: const Color(0xFF00FF00),
      image: 'assets/images/trans_lettuce.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Okro',
      description: 'Discover the versatility and health benefits of our fresh okra. These tender pods are perfect for adding a satisfying crunch to your soups, stews, and stir-fries. Whether you enjoy them sliced, whole, or fried, our okra is a delightful addition to your favorite recipes. With its unique texture and wholesome goodness, okra brings a touch of Southern comfort to every dish. Elevate your cooking and savor the flavor of okra – it\'s a culinary delight waiting to be explored',
      color: const Color(0xFF008000),
      image: 'assets/images/trans_okro.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Onion',
      color: const Color(0xFFD2B48C),
      description: 'Enhance the taste of your meals with our premium onions. These aromatic bulbs are the foundation of countless recipes, adding depth and richness to your culinary creations. Whether you\'re caramelizing them for a sweet twist, sautéing for savory goodness, or enjoying them raw in salads, our onions are the versatile ingredient you need. Elevate your cooking with the robust flavor and aroma of onions – they\'re a kitchen staple for a reason!',
      image: 'assets/images/trans_onion.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Pepper',
      description: 'Explore a world of flavor with our assortment of vibrant peppers. From the mild sweetness of bell peppers to the fiery kick of chili peppers, our selection adds a pop of color and spice to your recipes. Whether you\'re sautéing, stuffing, or garnishing, our peppers are the secret ingredient to transforming ordinary dishes into extraordinary feasts. Elevate your culinary adventures with the rich and diverse flavors of peppers – they\'re the palette of your kitchen canvas.',
      color: const Color(0xFFFF0000),
      image: 'assets/images/trans_pepper.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Tomatoes',
      description: 'Experience the authentic taste of homegrown tomatoes, bursting with flavor and nutrition. Whether you\'re making a classic pasta sauce, a vibrant salad, or simply slicing for a refreshing snack, our tomatoes are the heart and soul of your meals. Packed with vitamins and natural sweetness, these juicy treasures are the key to adding a burst of freshness to your recipes. Elevate your culinary creations with the goodness of our ripe and succulent tomatoes – they\'re the essence of garden-fresh flavor.',
      color: const Color(0xFFFF6347),
      image: 'assets/images/trans_tomatoe.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
];

List<FoodsData> fish = [
  FoodsData(
      title: 'Catfish',
      description: 'Dive into a world of deliciousness with our premium catfish. Sourced from pristine waters, our catfish is tender, flaky, and perfect for a variety of culinary delights. Whether you prefer it grilled, fried, or baked, our catfish promises a mouthwatering experience that seafood enthusiasts crave. Elevate your dining with the exquisite flavor and texture of our catfish – it\'s the catch of the day you won\'t want to miss.',
      color: const Color(0xFF6B6B6B),
      image: 'assets/images/catfish.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'FISH'),
  FoodsData(
      title: 'Salmon',
      description: 'Indulge in the exquisite taste of our premium salmon. These fillets are a culinary masterpiece, renowned for their tender texture and rich, flavorful profile. Whether you grill, bake, or sear them, our salmon offers a gourmet dining experience like no other. With its omega-3 goodness and versatility in recipes, our salmon is the choice of discerning seafood lovers. Elevate your palate and celebrate your love for fine dining with our succulent salmon – it\'s an epicurean adventure waiting to happen!',
      color: const Color(0xFFFF6B6B),
      image: 'assets/images/trans_salmon.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'FISH'),
  FoodsData(
      title: 'Tilapia',
      description: 'Experience the mild and versatile flavor of our tilapia fillets. These tender and flaky fillets are perfect for creating a variety of delectable dishes. Whether you prefer them grilled, fried, or baked, our tilapia lends itself to culinary creativity. Known for its delicate taste and lean protein, our tilapia is a favorite for both seasoned cooks and seafood newcomers. Elevate your dining experience and discover the joy of cooking with our premium tilapia – it\'s a palate-pleasing choice for any meal!',
      color: const Color(0xFFC0C0C0),
      image: 'assets/images/trans_tilapia.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
];

List<FoodsData> seaFood = [
  FoodsData(
      title: 'Crab',
      description: 'Indulge in the sweet, succulent meat of our premium crab. Renowned for its exquisite taste and tender texture, crab is a seafood lover\'s dream come true. Whether you\'re enjoying crab legs, claws, or crab cakes, our selection promises a culinary journey like no other. Dive into a world of savory delights and experience the ocean\'s bounty at its finest. Elevate your dining experience and savor the flavor of our delectable crab – it\'s a feast for the senses you won\'t soon forget.',
      color: const Color(0xFF8B4513),
      image: 'assets/images/trans_crab.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'SEAFOOD'),
  FoodsData(
      title: 'Prawns',
      description: 'Treat yourself to the delicate and delectable taste of our premium prawns. These plump and juicy gems are perfect for a variety of gourmet dishes. Whether you\'re grilling, sautéing, or adding them to your favorite recipes, our prawns offer a burst of ocean-fresh flavor in every bite. Known for their versatility and irresistible taste, our prawns are a favorite among seafood enthusiasts. Elevate your dining experience and savor the exquisite flavor of our succulent prawns – they\'re a culinary delight waiting to be explored.',
      color: const Color(0xFFFFA07A),
      image: 'assets/images/trans_prawns.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'SEAFOOD'),
  FoodsData(
      title: 'Lobster',
      description: 'Experience the epitome of seafood elegance with our succulent lobster. These tender, sweet, and meaty delights are perfect for creating unforgettable gourmet feasts. Whether you\'re enjoying lobster tails, lobster bisque, or lobster rolls, our selection promises a dining experience like no other. Known for their luxurious taste and visual appeal, our lobsters are the centerpiece of special occasions and fine dining. Elevate your palate and celebrate life\'s moments with our exquisite lobster – it\'s a taste of pure indulgence you won\'t want to miss!',
      color: const Color(0xFFE34234),
      image: 'assets/images/trans_lobster.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'SEAFOOD'),
];

List<FoodsData> meats = [
  FoodsData(
      title: 'Beef',
      description: 'Experience the rich and savory flavor of our high-quality beef cuts. From tender steaks to juicy burgers, our beef is the foundation of countless culinary delights. Whether you\'re grilling, roasting, or slow-cooking, our beef promises an indulgent dining experience that\'s perfect for family gatherings or special occasions. Known for its succulence and versatility, our beef is a favorite among meat lovers. Elevate your meals and delight your taste buds with the exceptional quality and taste of our premium beef – it\'s the secret ingredient to memorable dishes!',
      color: const Color(0xFF8B4513),
      image: 'assets/images/beef.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      quantity: 1,
      favAndCart: [false, false],
      categories: 'Proteins'),
  FoodsData(
      title: 'Lamb',
      description: 'Indulge in the succulent and rich taste of our premium lamb cuts. Whether you\'re roasting a leg of lamb, savoring lamb chops, or enjoying a hearty lamb stew, our selection promises an exceptional dining experience. Known for its delicate marbling and savory profile, lamb adds a touch of elegance to your meals. Elevate your palate and embrace the versatility of our lamb – it\'s a culinary masterpiece waiting to be explored. Experience the tender goodness that only the finest lamb can offer!',
      color: const Color(0xFF8B4513),
      image: 'assets/images/trans_lamb.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Goat Meat',
      description: 'Discover the distinct and robust taste of our high-quality goat meat. Whether you\'re simmering it in a curry, roasting it to perfection, or creating a hearty stew, our goat meat is the secret to adding depth and authenticity to your dishes. Known for its tender texture and bold flavor, goat meat is a favorite in global cuisines. Elevate your cooking and explore the world of savory delights with our premium goat meat – it\'s a culinary journey that promises unforgettable flavors.',
      color: const Color(0xFF8B4513),
      image: 'assets/images/trans_goat_meat.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Pork',
      description: 'Experience the rich and delectable flavor of our high-quality pork cuts. Whether you\'re grilling succulent pork chops, slow-cooking a tender pork roast, or savoring crispy bacon, our pork offers a world of culinary possibilities. Known for its versatility and mouthwatering taste, pork is a favorite among meat enthusiasts. Elevate your dining experience and explore the myriad of delicious recipes you can create with our premium pork – it\'s the key ingredient to unforgettable meals',
      color: const Color(0xFFA0522D),
      image: 'assets/images/trans_pork.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Chicken',
      description: 'Experience the versatile and savory flavor of our high-quality chicken cuts. Whether you\'re roasting a whole chicken, grilling juicy chicken breasts, or crafting a comforting chicken soup, our chicken is the heart of countless culinary creations. Known for its lean protein and ability to absorb a variety of flavors, chicken is a beloved choice for home cooks and chefs alike. Elevate your meals and enjoy the wholesome taste of our premium chicken – it\'s the go-to ingredient for delicious and satisfying dishes!',
      color: const Color(0xFFFFE4B5),
      image: 'assets/images/trans_chicken.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Eggs',
      color: const Color(0xFFFFD700),
      image: 'assets/images/eggs.png',
      description: 'Start your day with the pure goodness of our farm-fresh eggs. Whether you prefer them scrambled, sunny-side-up, or as the essential ingredient in your favorite recipes, our eggs promise unbeatable quality and flavor. Packed with protein and nutrients, they\'re the key to creating wholesome breakfasts and delectable dishes. From omelets to baking, our eggs are a versatile kitchen staple that guarantees a perfect start to every day. Experience the difference that farm-fresh makes – your taste buds will thank you.',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Turkey',
      description: 'Indulge in the succulent and tender taste of our high-quality turkey. Whether you\'re roasting a whole turkey for a holiday gathering, enjoying turkey slices in a sandwich, or savoring a hearty turkey chili, our selection offers a world of delicious possibilities. Known for its lean protein and versatility in recipes, turkey is a favorite for festive occasions and everyday meals. Elevate your dining experience and create memorable feasts with our premium turkey – it\'s the centerpiece of flavorful gatherings!',
      color: const Color(0xFF8B4513),
      image: 'assets/images/trans_turkey.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
];

List<FoodsData> all = [
  FoodsData(
      title: 'Pork',
      color: const Color(0xFFA0522D),
      description: 'Experience the rich and delectable flavor of our high-quality pork cuts. Whether you\'re grilling succulent pork chops, slow-cooking a tender pork roast, or savoring crispy bacon, our pork offers a world of culinary possibilities. Known for its versatility and mouthwatering taste, pork is a favorite among meat enthusiasts. Elevate your dining experience and explore the myriad of delicious recipes you can create with our premium pork – it\'s the key ingredient to unforgettable meals',
      image: 'assets/images/trans_pork.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Chicken',
       description: 'Experience the versatile and savory flavor of our high-quality chicken cuts. Whether you\'re roasting a whole chicken, grilling juicy chicken breasts, or crafting a comforting chicken soup, our chicken is the heart of countless culinary creations. Known for its lean protein and ability to absorb a variety of flavors, chicken is a beloved choice for home cooks and chefs alike. Elevate your meals and enjoy the wholesome taste of our premium chicken – it\'s the go-to ingredient for delicious and satisfying dishes!',
      color: const Color(0xFFFFE4B5),
      image: 'assets/images/trans_chicken.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Apples',
      color: Colors.red,
      image: 'assets/images/trans_apple.png',
       description:
          "Looking for the perfect snack or ingredient for your next meal?. "
          "Our apples are crisp, flavorful, and bursting with natural sweetness. " 
          " Whether you enjoy them as a healthy on-the-go snack or in your favorite "
          "recipes, our hand-picked apples are the ideal choice. Don't miss out – get your delicious apples today and elevate your culinary experience",
      categories: 'FRUITS',
      price: ' GHS 1',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Beef',
       description: 'Experience the rich and savory flavor of our high-quality beef cuts. From tender steaks to juicy burgers, our beef is the foundation of countless culinary delights. Whether you\'re grilling, roasting, or slow-cooking, our beef promises an indulgent dining experience that\'s perfect for family gatherings or special occasions. Known for its succulence and versatility, our beef is a favorite among meat lovers. Elevate your meals and delight your taste buds with the exceptional quality and taste of our premium beef – it\'s the secret ingredient to memorable dishes!',
      color: const Color(0xFF8B4513),
      image: 'assets/images/beef.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      quantity: 1,
      favAndCart: [false, false],
      categories: 'Proteins'),
  FoodsData(
      title: 'Banana',
      color: Colors.yellow,
      description: 'Discover the natural sweetness of our fresh, ripe bananas. Packed with flavor and loaded with energy, these bananas are the perfect snack or addition to your favorite recipes. Whether you enjoy them as a quick pick-me-up or use them in smoothies, baking, or cereal, our bananas are sure to satisfy your cravings. Don\'t wait – grab a bunch of these nutritious delights today',
      image: 'assets/images/trans_banana.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Tomatoes',
      color: const Color(0xFFFF6347),
      description: 'Experience the authentic taste of homegrown tomatoes, bursting with flavor and nutrition. Whether you\'re making a classic pasta sauce, a vibrant salad, or simply slicing for a refreshing snack, our tomatoes are the heart and soul of your meals. Packed with vitamins and natural sweetness, these juicy treasures are the key to adding a burst of freshness to your recipes. Elevate your culinary creations with the goodness of our ripe and succulent tomatoes – they\'re the essence of garden-fresh flavor.',
      image: 'assets/images/trans_tomatoe.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Pepper',
       description: 'Explore a world of flavor with our assortment of vibrant peppers. From the mild sweetness of bell peppers to the fiery kick of chili peppers, our selection adds a pop of color and spice to your recipes. Whether you\'re sautéing, stuffing, or garnishing, our peppers are the secret ingredient to transforming ordinary dishes into extraordinary feasts. Elevate your culinary adventures with the rich and diverse flavors of peppers – they\'re the palette of your kitchen canvas.',
      color: const Color(0xFFFF0000),
      image: 'assets/images/trans_pepper.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Onion',
      color: const Color(0xFFD2B48C),
      description: 'Enhance the taste of your meals with our premium onions. These aromatic bulbs are the foundation of countless recipes, adding depth and richness to your culinary creations. Whether you\'re caramelizing them for a sweet twist, sautéing for savory goodness, or enjoying them raw in salads, our onions are the versatile ingredient you need. Elevate your cooking with the robust flavor and aroma of onions – they\'re a kitchen staple for a reason!',
      image: 'assets/images/trans_onion.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Okro',
      color: const Color(0xFF008000),
      description: 'Discover the versatility and health benefits of our fresh okra. These tender pods are perfect for adding a satisfying crunch to your soups, stews, and stir-fries. Whether you enjoy them sliced, whole, or fried, our okra is a delightful addition to your favorite recipes. With its unique texture and wholesome goodness, okra brings a touch of Southern comfort to every dish. Elevate your cooking and savor the flavor of okra – it\'s a culinary delight waiting to be explored.',
      image: 'assets/images/trans_okro.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1),
  FoodsData(
      title: 'Tilapia',
      description: 'Experience the mild and versatile flavor of our tilapia fillets. These tender and flaky fillets are perfect for creating a variety of delectable dishes. Whether you prefer them grilled, fried, or baked, our tilapia lends itself to culinary creativity. Known for its delicate taste and lean protein, our tilapia is a favorite for both seasoned cooks and seafood newcomers. Elevate your dining experience and discover the joy of cooking with our premium tilapia – it\'s a palate-pleasing choice for any meal!',
      color: const Color(0xFFC0C0C0),
      image: 'assets/images/trans_tilapia.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'Proteins'),
  FoodsData(
      title: 'Salmon',
     description: 'Indulge in the exquisite taste of our premium salmon. These fillets are a culinary masterpiece, renowned for their tender texture and rich, flavorful profile. Whether you grill, bake, or sear them, our salmon offers a gourmet dining experience like no other. With its omega-3 goodness and versatility in recipes, our salmon is the choice of discerning seafood lovers. Elevate your palate and celebrate your love for fine dining with our succulent salmon – it\'s an epicurean adventure waiting to happen!.',
      color: const Color(0xFFFF6B6B),
      image: 'assets/images/trans_salmon.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favAndCart: [false, false],
      quantity: 1,
      categories: 'FISH'),
];
