import 'package:flutter/material.dart';
import 'package:assignment4/presentation/pages/web/desktopLayout.dart';
import 'mobile/mobileLayoutScreen.dart';

// SETTING UP LAYOUT SCREEN
class LayoutHome extends StatelessWidget {
  const LayoutHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {   //600 for desktop
          return const DesktopLayoutScreen();
        } else {
          return const MobileLayoutScreen();
        }
      },
    );
  }
}