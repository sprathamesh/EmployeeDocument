import 'package:flutter/material.dart';
import 'package:assignment4/presentation/pages/mobile/widgets/customNavigation.dart';
import 'widgets/getPage.dart';

//mobile layout 
class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({
    super.key,
  });

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Center(
        child: getPage(_currentIndex),
      ),
    );
  }
}