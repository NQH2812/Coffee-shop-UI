import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Product.dart';

  final List<Product> product = [
    Product(
      id: 'p29',
      name: 'Classic Cold Brew',
      imageUrl: 'https://i.pinimg.com/736x/9a/7a/fa/9a7afa5f41fbbc54383e7971df3eb95f.jpg',
      price: 3.50,
      categories: 'Cold Brew',
      size: {
        'S': 'Nhỏ',
        'M': 'Vừa',
        'L': 'Lớn',
      }
    ),
    Product(
      id: 'p30',
      name: 'Vanilla Cold Brew',
      imageUrl: 'https://i.pinimg.com/1200x/bc/68/66/bc68665767c1709149290486d2279bd9.jpg',
      price: 3.80,
      categories: 'Cold Brew',
      size: {
        'S': 'Nhỏ',
        'M': 'Vừa',
        'L': 'Lớn',
      }
    ),
    Product(
      id: 'p31',
      name: 'Caramel Cold Brew',
      imageUrl: 'https://i.pinimg.com/736x/22/1b/54/221b545576fc891208fe4b93974f6dba.jpg',
      price: 4.00,
      categories: 'Cold Brew',
      size: {
        'S': 'Nhỏ',
        'M': 'Vừa',
        'L': 'Lớn',
      }
    ),
    Product(
      id: 'p32',
      name: 'Coconut Cold Brew',
      imageUrl: 'https://i.pinimg.com/1200x/9c/e2/49/9ce249b552fa6ab687c5b24b02227a38.jpg',
      price: 4.20,
      categories: 'Cold Brew',
      size: {
        'S': 'Nhỏ',
        'M': 'Vừa',
        'L': 'Lớn',
      }
    ),
    Product(
      id: 'p33',
      name: 'Chocolate Cold Brew',
      imageUrl: 'https://www.beyondthebayoublog.com/wp-content/uploads/2024/06/Chocolate-Cream-Cold-Brew-Recipe-Just-5-Minutes-Away-2.png',
      price: 4.10,
      categories: 'Cold Brew',
      size: {
        'S': 'Nhỏ',
        'M': 'Vừa',
        'L': 'Lớn',
      }
    ),
  ];

Future<void> addProductToFirestore(List<Product> products) async {
  final firestore = FirebaseFirestore.instance;

  for (var p in products) {
    await firestore.collection('products').doc(p.id).set({
      'name': p.name,
      'imageUrl': p.imageUrl,
      'price': p.price,
      'categories': p.categories, 
      'size': p.size,
    });
  }
}
