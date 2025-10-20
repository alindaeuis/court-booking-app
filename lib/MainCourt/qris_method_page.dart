import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sewalapangan/MainCourt/success_payment.dart';
import 'package:sewalapangan/model/court_data.dart';
import 'package:sewalapangan/model/package_duration.dart';
import 'package:sewalapangan/model/payment.dart';

class QrisMethodPage extends StatefulWidget {
  final CourtData court;
  final DurationList package;
  final PaymentMethod payment;
  const QrisMethodPage({super.key, required this.court, required this.package, required this.payment});

  @override
  State<QrisMethodPage> createState() => _QrisMethodPageState();
}

class _QrisMethodPageState extends State<QrisMethodPage> {
  final formatter = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0,
  );
  int get totalPrice => int.parse(widget.package.price!) + int.parse(widget.package.serviceFee!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        title: Center(
          child: Text(
            'QRIS Payment',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Expanded(
              child: Column(
                children: [
                  Text(
                    "Payment Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    formatter.format(int.parse(totalPrice.toString())),
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    width: 300,
                    height: 300,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0XFFF3F4F6),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Image.asset("assets/images/qris.png"),
                  ),
                  SizedBox(height: 32,),
                  Text(
                    "Scan to Pay",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Point your camera at the QR code",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Open your mobile banking or e-wallet app and scan the QR code above to complete your payment",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF4B5563),
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60,),
                  Column(
                    children: [
                    SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.check, size: 16, color: Color(0xFFFFFFFF), ),
                      label: Text(
                        "I Have Paid",
                        style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => SuccessPaymentPage(court: widget.court, package: widget.package, payment: widget.payment)
                          )
                        );
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
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {}, 
                        label: Text(
                          "Share",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        icon: Icon(Icons.share, size: 16, color: Color(0xFF6B7280),),
                      ),
                      TextButton.icon(
                        onPressed: () {}, 
                        label: Text(
                          "Save",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        icon: Icon(Icons.save_alt_outlined, size: 16, color: Color(0xFF6B7280),),
                      ),
                    ],
                  )

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}