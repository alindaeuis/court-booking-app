import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sewalapangan/MainCourt/payment_page.dart';
import 'package:sewalapangan/model/court_data.dart';
import 'package:sewalapangan/model/package_duration.dart';

class PackageDuration extends StatefulWidget {
  final CourtData court;
  const PackageDuration({super.key, required this.court});

  @override
  State<PackageDuration> createState() => _PackageDurationState();
}

class _PackageDurationState extends State<PackageDuration> {
  
  final formatter = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        title: Center(
          child: Text(
            'Package Duration',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Color(0XFFFFFFFF),
      body: ListView.builder(
          itemCount: duration.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          final DurationList package = duration[index];
          return Padding(
            padding: EdgeInsets.only(top: 13, bottom: 0, left: 16, right: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          court: widget.court,
                          package: package
                        ),
                      )
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1,
                      )
                    ),
                    elevation: 0,
                    
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                package.duration!,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                formatter.format(int.parse(package.price!.replaceAll(".", ""))),
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                package.description!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              Text(
                                "Per session",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF9CA3AF),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
          },
        ),
    );
  }
}