import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_form/widgets/login_bottom_sheet.dart';
import 'package:login_register_form/widgets/register_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00050522),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Column(
            children: [
              Image.asset(
                "images/Illustration_picture.png",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFEF5858),
                  fontFamily: GoogleFonts.roboto().fontFamily, //nosifer
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                  style: TextStyle(
                    fontSize: 19,
                    color: const Color.fromRGBO(244, 244, 244, 1),
                    fontWeight: FontWeight.w100,
                    fontFamily: GoogleFonts.getFont('Gruppo').fontFamily,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const RegisterBottomSheet());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 222, 105, 1),
                  minimumSize: const Size(281, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Border radius
                    side: const BorderSide(
                      color: Color.fromRGBO(255, 222, 105, 1), // Border color
                      width: 2, // Border width
                    ),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 2.66,
                  ),
                ),
              ),
              const SizedBox(height: 20), // 681px - (606px + 60px)
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          const LoginBottomSheet()); // LoginBottomSheet()
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000000),
                  minimumSize: const Size(281, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Border radius
                    side: const BorderSide(
                      color: Color.fromRGBO(255, 222, 105, 1), // Border color
                      width: 3, // Border width
                    ),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 222, 105, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 2.66,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'All Right Reserved @2021',
                style: TextStyle(
                  color: const Color(0xFFFFED69),
                  fontSize: 11,
                  fontWeight: FontWeight.w100,
                  height: 2.66,
                  fontFamily: GoogleFonts.getFont('Gruppo').fontFamily,
                ),
              ),
            ],
          )),
    );
  }
}
