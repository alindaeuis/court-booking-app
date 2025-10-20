import 'package:flutter/material.dart';
import 'package:sewalapangan/enterance/enterance_page.dart';

void main() {
  runApp(const CourtBooking());
}
class CourtBooking extends StatelessWidget {
  const CourtBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sewa Lapangan",
      theme: ThemeData(),
      home: EnterancePage(),
    );
  }
}