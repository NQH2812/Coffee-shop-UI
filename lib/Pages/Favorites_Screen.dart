import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffee_shop/service/addproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/favotitesCart.dart';
import '../model/modeltest.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Center(child: Text("Please log in"));
    }

    return SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('favorites')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
      
          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return Center(child: Text("No favorites yet"));
          }
          final products = docs.map((doc) => Product.fromFirestore(doc)).toList();
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: GridView.builder( 
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // ← 2 sản phẩm mỗi dòng
                  crossAxisSpacing: 12, // ← khoảng cách giữa các cột
                  mainAxisSpacing: 12,  // ← khoảng cách giữa các dòng
                  childAspectRatio: 3/4, // ← điều chỉnh tỷ lệ khung hiển thị
                ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Favotitescart(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}