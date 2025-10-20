import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewalapangan/MainCourt/success_payment.dart';
import 'package:sewalapangan/MainCourt/qris_method_page.dart';
import 'package:sewalapangan/model/court_data.dart';
import 'package:sewalapangan/model/package_duration.dart';
import 'package:sewalapangan/model/payment.dart';

class PaymentMethodPage extends StatefulWidget {
  final DurationList package;
  final CourtData court;
  const PaymentMethodPage({super.key, required this.package, required this.court});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  // void _cashPaymentMethod(BuildContext context) {
  //   Card()
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        title: Center(
          child: Text(
            'Payment Method',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Payment",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 3,),
              Text(
                "Select your preferred payment method",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 15,),
              // _cashPaymentMethod(),
              ListView.builder(
                itemCount: paymentList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                final PaymentMethod payment  = paymentList[index];
                return Padding(
                  padding: EdgeInsets.only(top: 13, bottom: 0),
                  child: Column(
                    children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => payment.id.toString() == "1" ? SuccessPaymentPage(court: widget.court, package: widget.package, payment: payment) : QrisMethodPage(court: widget.court, package: widget.package, payment: payment), 
                          )
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                                color: Color(0xFFE5E7EB),
                                width: 2,
                              )
                        ),
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color.fromARGB(255, 233, 233, 233), // background color
                                    ),
                                    child: payment.id.toString() == "1" ? Icon(
                                      Icons.payments_rounded,
                                      color: Color(0XFF1C1C1C),
                                      size: 20,
                                    ) : Icon(
                                      Icons.qr_code_rounded,
                                      color: Color(0XFF1C1C1C),
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        payment.paymentMethod!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 3,),
                                      Text(
                                        payment.paymentCategory!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Color(0xFF6B7280),
                                        ),
                                      ),
                                     
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 8,),
                              Divider(color: Color(0xFFF3F4F6),),
                              SizedBox(height: 8,),
                              Text(
                                payment.description!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ],
                  ),
                );
                },
              ),
              SizedBox(height: 50,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0XFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Color(0xFF1C1C1C), size: 16,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Booking Policy",
                            style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                              "Your payment method can’t be changed after completing the order",
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF4B5563),
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}