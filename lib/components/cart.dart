import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/Product.dart';
import '../Pages/Details_Screen.dart';

class CartWidget extends StatelessWidget {
  final Product product;
  const CartWidget({super.key, required this.product});

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        offset: Offset(10, 8),
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8D4D00), Color.fromARGB(255, 39, 14, 0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Center(
                          child: Text(
                            product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Row(
                              children: [
                                const Icon(Icons.star_rounded, size: 20, color: Colors.white),
                                const SizedBox(width: 4),
                                Text(
                                  "5.0",
                                  style: GoogleFonts.outfit(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          text: "Volume: ",
                          style: GoogleFonts.outfit(color: Colors.white70, fontSize: 20),
                          children: [
                            TextSpan(
                              text: "160ml",
                              style: GoogleFonts.outfit(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              "\$ ${product.price.toStringAsFixed(2)}",
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(5, 8),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.white12,
                        backgroundImage: product.imageUrl.startsWith('http')
                            ? NetworkImage(product.imageUrl)
                            : AssetImage(product.imageUrl) as ImageProvider,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
