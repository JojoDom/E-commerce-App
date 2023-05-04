
class FoodsData {
  final String title;
  final String image;
  final String categories;
  final int? quantity;
  final String price;
  final String? measuringUnit;
  final List<bool> favorite;

  FoodsData( 
      {required this.title,
      required this.price,
      this.quantity,
      this.measuringUnit,
      required this.favorite,
      required this.image,
      required this.categories});
}


List<FoodsData> fruits = [
  FoodsData(
      title: 'Apples',
      image: 'assets/images/trans_apple.png',
      categories: 'FRUITS',
      price: ' GHS 1',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Avocado',
      image: 'assets/images/trans_avocado.png',
      categories: 'FRUITS',
      price: ' GHS 1',
      favorite: [false],
      measuringUnit: 'kg',
      quantity: 0),
  FoodsData(
      title: 'Banana',
      image: 'assets/images/trans_banana.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Berries',
      image: 'assets/images/trans_berry.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Grapes',
      image: 'assets/images/trans_grapes.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Mango',
      image: 'assets/images/trans_mango.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      favorite: [false],
      measuringUnit: 'kg',
      quantity: 0),
  FoodsData(
      title: 'Orange',
      image: 'assets/images/trans_orange.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      favorite: [false],
      measuringUnit: 'kg',
      quantity: 0),
  FoodsData(
      title: 'Watermelon',
      image: 'assets/images/trans_watermelon.png',
      categories: 'FRUITS',
      price: ' GHS 1.50',
      favorite: [false],
      measuringUnit: 'kg',
      quantity: 0),
];

List<FoodsData> veggies = [
  FoodsData(
      title: 'Beetroot',
      image: 'assets/images/trans_beetroot.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Bell Pepper',
      image: 'assets/images/trans_bell_pepper.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Broccoli',
      image: 'assets/images/trans_broccoli.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Cabbage',
      image: 'assets/images/trans_cabbage.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Carrots',
      image: 'assets/images/trans_carrots.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Cauliflower',
      image: 'assets/images/trans_cauliflower.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Cucumber',
      image: 'assets/images/trans_cucumber.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Pineapple',
      image: 'assets/images/trans_pineapple.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'GreenPeas',
      image: 'assets/images/trans_greenpeas.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Lemon',
      image: 'assets/images/trans_lemon.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Lettuce',
      image: 'assets/images/trans_lettuce.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Okro',
      image: 'assets/images/trans_okro.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Onion',
      image: 'assets/images/trans_onion.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Pepper',
      image: 'assets/images/trans_pepper.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
  FoodsData(
      title: 'Tomatoes',
      image: 'assets/images/trans_tomatoe.png',
      categories: 'VEGGIES',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0),
];

List<FoodsData> fish = [
  FoodsData(
      title: 'Catfish',
      image: 'assets/images/catfish.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'FISH'),
  FoodsData(
      title: 'Salmon',
      image: 'assets/images/trans_salmon.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'FISH'),
  FoodsData(
      title: 'Tilapia',
      image: 'assets/images/trans_tilapia.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
];

List<FoodsData> seaFood = [
  FoodsData(
      title: 'Crab',
      image: 'assets/images/trans_crab.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'SEAFOOD'),
  FoodsData(
      title: 'Prawns',
      image: 'assets/images/trans_prawns.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'SEAFOOD'),
  FoodsData(
      title: 'Lobster',
      image: 'assets/images/trans_lobster.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'SEAFOOD'),
];

List<FoodsData> meats = [
  FoodsData(
      title: 'Beef',
      image: 'assets/images/beef.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      quantity: 0,
      favorite: [false],
      categories: 'Proteins'),
  FoodsData(
      title: 'Lamb',
      image: 'assets/images/trans_lamb.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
  FoodsData(
      title: 'Goat Meat',
      image: 'assets/images/trans_goat_meat.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
  FoodsData(
      title: 'Pork',
      image: 'assets/images/trans_pork.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
  FoodsData(
      title: 'Chicken',
      image: 'assets/images/trans_chicken.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
  FoodsData(
      title: 'Eggs',
      image: 'assets/images/eggs.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
  FoodsData(
      title: 'Turkey',
      image: 'assets/images/trans_turkey.png',
      price: ' GHS 1.50',
      measuringUnit: 'kg',
      favorite: [false],
      quantity: 0,
      categories: 'Proteins'),
];
