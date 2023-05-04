class Categories {
  final String categoryName;
  final String image;
  final String key;

  Categories(
      {required this.categoryName, required this.image, required this.key});
}

List<Categories> categories = [
  Categories(categoryName: 'All', image: '', key: 'All'),
  Categories(categoryName: 'Fruits', image: 'assets/images/trans_fruits.png', key: 'FRUITS'),
  Categories(categoryName: 'Veggies', image: 'assets/images/trans_veggies.png', key: 'VEGGIES'),
  Categories(categoryName: 'Fish', image: 'assets/images/trans_fish.png', key: 'FISH'),
  Categories(categoryName: 'Bakes', image: 'assets/images/trans_bakes.png', key: 'BAKES'),
  Categories(categoryName: 'Meat', image: 'assets/images/trans_meat.png', key: 'MEAT'),
  Categories(categoryName: 'Sea Food', image: 'assets/images/trans_sea-food.png', key: 'SEAFOOD'),
  Categories(categoryName: 'Diary', image: 'assets/images/trans_diary.png', key: 'DIARY'),
  Categories(categoryName: 'Cereals', image: 'assets/iamges/trans_cereals.png', key: 'CEREALS')

];
