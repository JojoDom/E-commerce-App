class CarouselBuilderItems {
  final String title;
  final String subTitle;
  final String image;
  final String key;
  CarouselBuilderItems(
      {required this.subTitle,
      required this.image,
      required this.title,
      required this.key});
}

List<CarouselBuilderItems> carouselData = [
  CarouselBuilderItems(
    title: 'Proteins',
    subTitle: 'Chicken, beef,fish and many more',
    image: "assets/images/proteins.png",
    key: 'P'
  ),
  CarouselBuilderItems(
    title: 'Fruits and Vegetables',
    subTitle: 'Fresh fruits and vegetables',
    image: "assets/images/fruits_and_vegetables.png",
    key: 'FV'
  ),
  CarouselBuilderItems(
    title: 'Cereals and Grains',
    subTitle: 'Rice, maize,gari and more',
    image: "assets/images/grains.png",
    key: 'CG'
  ),
];
