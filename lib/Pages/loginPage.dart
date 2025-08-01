import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/homepage.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8D4D00),
            Color(0xFF271500)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/Logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    'Coffee Shop',
                    style: GoogleFonts.pacifico(fontSize: 40, fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    style: GoogleFonts.outfit(color: Color(0xFFBF6A02), fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      hintStyle: GoogleFonts.outfit(color: Colors.grey.shade600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    style: GoogleFonts.outfit(color: Color(0xFFBF6A02), fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: GoogleFonts.outfit(color: Colors.grey.shade600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage_screen()),
                    );
                  },
                  child: Container(
                    width: 181,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFCF8F41),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.outfit(color: Color(0xFFCF8F41), fontSize: 16, fontWeight: FontWeight.bold),
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