import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/modeltest.dart';

Future<void> toggleFavorite(Product product) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final favRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('favorites')
      .doc(product.id);

  final doc = await favRef.get();

  if (doc.exists) {
    await favRef.delete();
  } else {
    await favRef.set({
      'id': product.id,
      'name': product.name,
      'imageUrl': product.imageUrl,
      'price': product.price,
      'categories': product.categories,
      'size': product.size,
    });
  }
}

Stream<bool> Favorites(Product product) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return Stream.value(false);

  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('favorites')
      .doc(product.id)
      .snapshots()
      .map((doc) => doc.exists);
}