import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/cart.dart';
import 'package:coffee_shop/model/modeltest.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final List<String> categories = ['Cappuccino', 'Tea', 'Bread', 'Vietnamese Coffee', 'Milk', 'Latte', 'Espresso', 'Cold Brew'];
  int currentIndex = 0; 
  int selectedCategoryIndex = 0;

  final PageController _controller = PageController(viewportFraction: 0.6, initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/assets/Avatar.jpg'),
          ),
        ),
        title: Text(
          'Coffee Shop', 
          style: GoogleFonts.pacifico(fontSize: 40, fontWeight: FontWeight.normal),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications_none)
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  kToolbarHeight - MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(50),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: GoogleFonts.outfit(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                          filled: true,
                          fillColor: Color(0xFFF1F1F1),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFBF6A02),
                              ),
                              child: Icon(Icons.search, color: Colors.white),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Color(0xFFE3E3E3), width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Color(0xFFBF6A02), width: 2.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment(-0.85, 0),
                    child: Text(
                      'Categories',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      padding: EdgeInsets.only(left: 20.0),
                      itemBuilder: (context, index) {
                        final isSelected = index == selectedCategoryIndex;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFFBF6A02) : Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                categories[index],
                                style: GoogleFonts.outfit(
                                  color: isSelected ? Colors.white : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                        .collection('products')
                        .where('categories', isEqualTo: categories[selectedCategoryIndex])
                        .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text('Product not available'));
                        }
                        final products = snapshot.data!.docs
                          .map((doc) => Product.fromFirestore(doc))
                          .toList();

                        return Center(
                          child: SizedBox(
                            height: 500,
                            child: PageView.builder(
                              itemCount: products.length,
                              controller: _controller,
                              itemBuilder: (context, index) {
                                return ListenableBuilder(
                                  listenable: _controller,
                                  builder: (context, child) {
                                    double factor = 1;
                                    if (_controller.position.hasContentDimensions) {
                                      factor = 1 - (_controller.page! - index).abs();
                                    }
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                                      child: Transform.scale(
                                        scale: 0.8 + (factor * 0.2),
                                        child: CartWidget(product: products[index]),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}