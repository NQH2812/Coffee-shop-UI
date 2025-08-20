import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String categories;
  final Map<String, String> size;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.categories,
    required this.size,
  });

  // Tạo Product từ Firestore Document
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    
    Map<String, String> sizeMap = {};
    if (data['size'] != null) {
      Map<String, dynamic> sizeData = data['size'] as Map<String, dynamic>;
      sizeData.forEach((key, value) {
        sizeMap[key] = value.toString();
      });
    }

    return Product(
      id: doc.id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      categories: data['categories']?? '',
      size: sizeMap,
    );
  }

  List<String> getSizeValues() {
    return size.values.toList();
  }
}