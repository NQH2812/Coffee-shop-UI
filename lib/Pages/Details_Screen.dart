import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/modeltest.dart';
import '../components/favorites_button.dart';

class Details_Screen extends StatefulWidget {
  final Product product;
  const Details_Screen({super.key, required this.product,});

  @override
  State<Details_Screen> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {
  bool isFavorite = false;
  bool isShoppingCart = false;
  final List<String> sizes = ['Small', 'Medium', 'Large'];
  int selectedSizeIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 365,
                      width: double.infinity, 
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(5, 8),
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          widget.product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Color(0xFFBF6A02)),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          // Favorite button
                          FavoritesButton(product: widget.product),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          widget.product.name, 
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(fontSize: 35, fontWeight: FontWeight.bold,)
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 195, 115, 18),
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
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${widget.product.price.toStringAsFixed(2)}', style: GoogleFonts.outfit(color: Color(0xFFBF6A02), fontSize: 25, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove, color: Color(0xFFBF6A02)),
                        ),
                        Text("$quantity", style: GoogleFonts.outfit(color: Colors.grey.shade600, fontSize: 16)),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Color(0xFFBF6A02))
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Details", style: GoogleFonts.outfit(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _ExpandableRichText(),
                SizedBox(height: 20),
                Text("Size", style: GoogleFonts.outfit(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      padding: EdgeInsets.only(left: 10.0),
                      itemBuilder: (context, index) {
                        final isSelected = index == selectedSizeIndex;
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSizeIndex = index;
                              });
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFFBF6A02) : Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                sizes[index],
                                style: GoogleFonts.outfit(
                                  color: isSelected ? Colors.white : Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFBF6A02), width: 1.5),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isShoppingCart = !isShoppingCart;
                            });
                          }, 
                          icon: Icon(
                            isShoppingCart ? Icons.shopping_bag : Icons.shopping_bag_outlined,
                            color: Color(0xFFBF6A02),
                          ),
                        ),
                      ),
                    ),
                    // Buy Now button
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: 45,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFBF6A02),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(child: Text("Buy now", style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpandableRichText extends StatefulWidget {
  @override
  State<_ExpandableRichText> createState() => _ExpandableRichTextState();
}

class _ExpandableRichTextState extends State<_ExpandableRichText> {
  bool _expanded = false;

  final String textContent =
      "Cappuccino Start your day with the perfect pour — our cappuccino is a timeless blend of bold espresso, smooth steamed milk, and creamy foam. Crafted with care, each cup offers a comforting balance of strength and softness. Whether you're catching up with friends or enjoying a quiet moment alone, it's the kind of drink that turns an ordinary visit into something special. Try it with a hint of cinnamon or cocoa for a cozy touch.";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textContent,
          maxLines: _expanded ? null : 2,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            color: Colors.black45,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(
            _expanded ? 'Read less' : 'Read more',
            style: GoogleFonts.outfit(
              fontSize: 16,
              color: Color(0xFFBF6A02),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

