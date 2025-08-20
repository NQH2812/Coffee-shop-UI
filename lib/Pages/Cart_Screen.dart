import 'package:coffee_shop/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import '../components/savedCart.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  int currentIndex = 2;
  final List<int> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Your Cart',
          style: GoogleFonts.outfit(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(bottom: 60), 
              itemCount: 3,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  Savedcart(product: demoProducts[0]),
                  const SizedBox(height: 10),
                ],
              );
            },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DottedDashedLine(
                      height: 0, 
                      width: double.infinity, 
                      axis: Axis.horizontal,
                      dashColor: Color(0xFF8D4D00),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 41,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8D4D00),
                            Color(0xFFFFFF),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        child: Text(
                          'Voucher',
                          style: GoogleFonts.flamenco(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charges',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 24
                          ),
                        ),
                        Text(
                          '\$ 0.76',
                          style: GoogleFonts.tiltNeon(
                            color: Colors.black,
                            fontSize: 24
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service Charges',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 24
                          ),
                        ),
                        Text(
                          '\$ 0.11',
                          style: GoogleFonts.tiltNeon(
                            color: Colors.black,
                            fontSize: 24
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    const DottedDashedLine(
                      height: 0, 
                      width: double.infinity, 
                      axis: Axis.horizontal,
                      dashColor: Color(0xFF8D4D00),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 30
                          ),
                        ),
                        Text(
                          '\$ 17.58',
                          style: GoogleFonts.tiltNeon(
                            color: Colors.black,
                            fontSize: 30
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Center(
                        child: Container(
                          height: 59,
                          width: 236,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFBF6A02),
                          ),
                          child: Center(
                            child: Text(
                              'Pay now',
                              style: GoogleFonts.outfit(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}