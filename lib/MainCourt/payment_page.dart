import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sewalapangan/MainCourt/payment_method_page.dart';
import 'package:sewalapangan/model/court_data.dart';
import 'package:sewalapangan/model/package_duration.dart';

class PaymentPage extends StatefulWidget {
  final DurationList package;
  final CourtData court;
  const PaymentPage({super.key, required this.package, required this.court});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        title: Center(
          child: Text(
            'Order Summary',
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
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.court.name!,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded, size: 16, color: Colors.grey[700],),
                        SizedBox(width: 5,),
                        Text(
                          "Jalan Cibalok, Blok 31b",
                          style: GoogleFonts.poppins(
                            color: Color(0xFF4B5563),
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month, size: 16, color: Colors.grey[700],),
                            SizedBox(width: 5,),
                            Text(
                              "Date",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF374151),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Text(
                        "Today, " + today,
                        style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer, size: 16, color: Colors.grey[700],),
                            SizedBox(width: 5,),
                            Text(
                              "Duration",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF374151),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Text(
                        widget.package.duration!,
                        style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.discount, size: 16, color: Colors.grey[700],),
                            SizedBox(width: 5,),
                            Text(
                              "Price per Hour",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF374151),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Text(
                        formatter.format(int.parse(widget.package.price!)),
                        style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.discount, size: 16, color: Colors.grey[700],),
                            SizedBox(width: 5,),
                            Text(
                              "Subtotal" + " " + "(" + widget.package.duration! + ") ",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF374151),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Text(
                        formatter.format(int.parse(widget.package.price!)),
                        style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.discount, size: 16, color: Colors.grey[700],),
                            SizedBox(width: 5,),
                            Text(
                              "Service Fee",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF374151),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Text(
                        formatter.format(int.parse(widget.package.serviceFee!)),
                        style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                            Text(
                              "Total",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF374151),
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                        Text(
                        formatter.format(int.parse(totalPrice.toString())),
                        style: GoogleFonts.poppins(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
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
                              "Free cancellation up to 5 hours before your booking time. Equipment rental available on- site.",
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
              SizedBox(height: 20,),
              Divider(),
              SizedBox(height: 15,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward, size: 16, color: Color(0xFFFFFFFF), ),
                  label: Text(
                    "Choose Payment Method",
                    style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => PaymentMethodPage(
                        package: widget.package,
                        court: widget.court,
                      ))
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
            ],
          ),
        ),
      ),
    );
  }
}