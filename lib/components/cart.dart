import 'package:coffee_shop/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/detailsPage.dart';

class CartWidget extends StatelessWidget {
  final Product product;
  const CartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details_Screen(product: demoProducts[0],)),
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
                    gradient: LinearGradient(
                      colors: [Color(0xFF8D4D00), Color.fromARGB(255, 39, 14, 0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 20,bottom: 5),
                        child: Text(product.name, style: GoogleFonts.outfit(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
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
                                Icon(Icons.star_rounded, size: 20, color: Colors.white),
                                SizedBox(width: 4),
                                Text("5.0", style: GoogleFonts.outfit(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      RichText(
                        text: TextSpan(
                          text: "Volume: ",
                          style: GoogleFonts.outfit(color: Colors.white70, fontSize: 20 ),
                          children: [
                            TextSpan(
                              text: "160ml",
                              style: GoogleFonts.outfit(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        )
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text("\$ ${product.price}", style: GoogleFonts.outfit(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                            Spacer(),
                            IconButton(
                              onPressed: () {}, 
                              icon: Icon(Icons.add_circle_rounded, color: Colors.white, size: 50)),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(5, 8),
                            ),
                          ]
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage(product.imageUrl), 
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