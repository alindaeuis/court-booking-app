import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sewalapangan/MainCourt/court_list_page.dart';
import 'package:sewalapangan/model/court_data.dart';
import 'package:sewalapangan/model/package_duration.dart';
import 'package:sewalapangan/model/payment.dart';

class SuccessPaymentPage extends StatefulWidget {
  final CourtData court;
  final DurationList package;
  final PaymentMethod payment;
  const SuccessPaymentPage({super.key, required this.court, required this.package, required this.payment});

  @override
  State<SuccessPaymentPage> createState() => _SuccessPaymentPageState();
}

class _SuccessPaymentPageState extends State<SuccessPaymentPage> {
  final formatter = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0,
  );
  int get totalPrice => int.parse(widget.package.price!) + int.parse(widget.package.serviceFee!);
  @override
  Widget build(BuildContext context) {
    final String today = DateFormat('MMM d').format(DateTime.now());
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Column(
              children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 233, 233, 233), // background color
                    ),
                    child: Icon(
                      Icons.check,
                      color: Color(0XFF1C1C1C),
                      size: 35,
                    ),
                  ),
                  SizedBox(height: 18,),
                  Text(
                  "Booking Successful",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5,),
                Text(
                "Your court has been reserved successfully",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Color(0XFFF4F4F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Booking Details",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Court Name",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Color(0XFF4B5563)
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Date",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Color(0XFF4B5563)
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Duration",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Color(0XFF4B5563)
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Payment Method",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Color(0XFF4B5563)
                              ),
                            ),
                            SizedBox(height: 8,),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.court.name!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              today,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              widget.package.duration!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              widget.payment.paymentCategory!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8,),
                          ],
                        )
                        
                      ],
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Color(0xFF1C1C1C),),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          formatter.format(int.parse(totalPrice.toString())),
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.file_download_outlined, size: 16, color: Color(0xFFFFFFFF), ),
                  label: Text(
                    "Download Receipt",
                    style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute()
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                ),
              ),
              SizedBox(height: 13,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.home, size: 16, color: Colors.black,),
                  label: Text(
                    "Back to Home",
                    style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CourtListPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFF4F4F4),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                ),
              ),
              ],
            ),
        ),
      ),
    );
  }
}