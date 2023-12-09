import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment4/presentation/pages/mobile/widgets/mobileAppBar.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MobileAppBar(),
      body: Center(
        child: Text(
          'Welcome To CentraLogic',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.3,
            letterSpacing: -0.4,
            color: const Color(0xff303030),
          ),
        ),
      ),
    );
  }
}