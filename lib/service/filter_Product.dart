import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/modeltest.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Lọc sản phẩm theo category
  Stream<List<Product>> getProductsByCategory(String categories) {
    if (categories == 'Tất cả') {
      return _firestore
          .collection('products')
          .where('isAvailable', isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Product.fromFirestore(doc))
              .toList());
    } else {
      return _firestore
          .collection('products')
          .where('categories', isEqualTo: categories)
          .where('isAvailable', isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Product.fromFirestore(doc))
              .toList());
    }
  }
}