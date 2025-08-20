import 'package:coffee_shop/Pages/Signin_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../service/auth_service.dart';


class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController = TextEditingController();

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
                    controller: _emailController,
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
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 20),
                // Container(
                //    width: MediaQuery.of(context).size.width * 0.8,
                //   child: TextField(
                //     style: GoogleFonts.outfit(color: Color(0xFFBF6A02), fontSize: 16),
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.white,
                //       hintText: 'Confirm Password',
                //       hintStyle: GoogleFonts.outfit(color: Colors.grey.shade600),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(50),
                //         borderSide: BorderSide.none,
                //       ),
                //     ),
                //     controller: _confirmPasswordController,
                //     keyboardType: TextInputType.visiblePassword,
                //     textInputAction: TextInputAction.done,
                //   ),
                // ),
                // SizedBox(height: 20),
                GestureDetector( 
                  onTap: () async {
                    await AuthService().signup(
                      email: _emailController.text, 
                      password: _passwordController.text,
                      context: context,
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
                        'Sign Up',
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
                      'Already have an account?',
                      style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SigninScreen()),
                        );
                      },
                      child: Text(
                        'Login',
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