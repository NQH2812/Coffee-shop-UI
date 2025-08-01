class Product {
  final String id;
  final String imageUrl;
  final String name;
  final String size;
  final double price;

  Product(
    {
      required this.id, 
      required this.imageUrl,
      required this.name, 
      required this.size, 
      required this.price
    }
  );
}

final List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Cappuccino',
    size: 'S',
    imageUrl: 'lib/assets/Capuchio.jpg',
    price: 4.99,
  ),
];
