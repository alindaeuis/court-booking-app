import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewalapangan/MainCourt/court_list_page.dart';

class EnterancePage extends StatelessWidget {
  const EnterancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150, left: 25, right: 25, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/enterance.png'),
                  SizedBox(height: 70,),
                  Text(
                    "Court Booking",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Easily and quickly book sports courts at your convenience. Choose from a variety of courts, select your preferred duration, and confirm your booking seamlessly",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF4B5563)
                    ),
                  ),
                  SizedBox(height: 90,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const CourtListPage()),
                        );
                      }, 
                      child: Text("Get Started"),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      foregroundColor: Colors.white,
                      shadowColor: Colors.black,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )
                                    ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
      ),
    );
  }
}