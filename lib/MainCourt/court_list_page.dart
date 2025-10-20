import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sewalapangan/MainCourt/court_detail_page.dart';
import 'package:sewalapangan/MainCourt/package_duration_page.dart';
import 'package:sewalapangan/model/court_data.dart';

class CourtListPage extends StatefulWidget {
  const CourtListPage({super.key});

  @override
  State<CourtListPage> createState() => _CourtListPageState();
}

class _CourtListPageState extends State<CourtListPage> {
  final formatter = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30, right: 0, left: 0, bottom: 0),
            child: Column(
              children: [
                Text(
                  "Sports Courts",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 15,),
                ListView.builder(
                  itemCount: courtList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final CourtData courtData = courtList[index];
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => CourtDetailPage(court: courtData)
                            ));
                        },
                        child: Card(
                          color: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AspectRatio(
                                aspectRatio: 16/9,
                                child: Image.asset(
                                  courtData.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          courtData.name!,
                                          style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              courtData.place! + " " + "|" + " " + courtData.facility!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                color: Color(0xFF4B5563),
                                              
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star, 
                                            size: 20,
                                            color: Color(0xFFEAB308),
                                          ),
                                          SizedBox(width: 2,),
                                          Text(
                                            courtData.rating!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                          
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatter.format(int.parse(courtData.price!.replaceAll(".", ""))) + courtData.duration!,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(builder: (context) => PackageDuration(court: courtData))
                                        );
                                      }, 
                                      child: Text("Select"),
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF1F2937),
                                      foregroundColor: Colors.white,
                                      shadowColor: Colors.black,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                                      textStyle: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      )
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}