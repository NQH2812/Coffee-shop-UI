import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/favorites_button.dart';
import '../model/Product.dart';
import '../Pages/Details_Screen.dart';

class Favotitescart extends StatelessWidget {
  final Product product;
  const Favotitescart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details_Screen(product: product),
          ),
        );
      },
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF8D4D00),
            width: 2,
          ),
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xFF8D4D00),
          //     Color(0xFF271500)
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 4, bottom: 9.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  product.imageUrl,
                  height: 150,
                  width: 190,
                  fit: BoxFit.cover,
                ),
              ),
              Text( product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D4D00),
                    ),
                  ),
                  Spacer(),
                  FavoritesButton(product: product),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}