class Categories {
  final String categoryName;
  final String image;
  final String key;

  Categories(
      {required this.categoryName, required this.image, required this.key});
}

List<Categories> categories = [
  Categories(categoryName: 'Popular', image: 'assets/images/trans_groceries_bag.png', key: 'Popular'),
  Categories(categoryName: 'Fruits', image: 'assets/images/trans_fruits.png', key: 'FRUITS'),
  Categories(categoryName: 'Veggies', image: 'assets/images/trans_veggies.png', key: 'VEGGIES'),
  Categories(categoryName: 'Fish', image: 'assets/images/trans_fish.png', key: 'FISH'),
  Categories(categoryName: 'Meat', image: 'assets/images/trans_meat.png', key: 'MEAT'),
  Categories(categoryName: 'Sea Food', image: 'assets/images/trans_sea-food.png', key: 'SEAFOOD'),

];
