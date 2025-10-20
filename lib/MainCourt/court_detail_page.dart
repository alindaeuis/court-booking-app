import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sewalapangan/MainCourt/package_duration_page.dart';
import 'package:sewalapangan/model/court_data.dart';

class CourtDetailPage extends StatefulWidget {
  final CourtData court;
  const CourtDetailPage({super.key, required this.court});

  @override
  State<CourtDetailPage> createState() => _CourtDetailPageState();
}

class _CourtDetailPageState extends State<CourtDetailPage> {
  final formatter = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    widget.court.image!,
                    fit: BoxFit.cover,
                  )),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      widget.court.name!,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.grey[700],
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.court.openDays!,
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.access_alarms_sharp, color: Colors.grey[700]),
                            SizedBox(height: 5),
                            Text(
                              widget.court.openTime!,
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.money, color: Colors.grey[700]),
                            SizedBox(height: 5),
                            Text(
                              formatter.format(
                                int.parse(widget.court.price!.replaceAll(".", "")),
                              ),
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      widget.court.description!,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50,),
                    
                  ],
                ),
              )
            ],
          ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                "Book Now",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => PackageDuration(court: widget.court))
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
        ),
      ),
    );
  }
}
