import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/product.dart';

class Savedcart extends StatefulWidget {
  final Product product;

  const Savedcart({super.key, required this.product});

  @override
  State<Savedcart> createState() => _SavedcartState();
}

class _SavedcartState extends State<Savedcart> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8D4D00),
            Color(0xFF271500),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              widget.product.imageUrl,
              height: 100,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),

          // Product
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Size: ${widget.product.size}',
                    style: GoogleFonts.anonymousPro(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.tiltNeon(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quantity
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Color(0xFFCF8F41)),
                onPressed: () {
                  setState(() {
                    if (quantity > 1) quantity--;
                  });
                },
              ),
              Text(
                '$quantity',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Color(0xFFCF8F41)),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
