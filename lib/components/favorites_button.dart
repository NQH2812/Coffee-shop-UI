import 'package:coffee_shop/model/Product.dart';
import 'package:coffee_shop/service/add_FavoritesList.dart';
import 'package:flutter/material.dart';

class FavoritesButton extends StatefulWidget {
  final Product product;
  const FavoritesButton({super.key, required this.product});

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  bool isFavorite = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: StreamBuilder<bool>(
        stream: Favorites(widget.product),
        builder: (context, snapshot) {
          final isFav = snapshot.data ?? false;
          return IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_outline_sharp,
              color: Color(0xFFBF6A02),
            ),
            onPressed: () {
              toggleFavorite(widget.product);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          );
        },
      ),
    );
  }
}