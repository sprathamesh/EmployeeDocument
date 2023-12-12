import 'package:flutter/material.dart';
import 'package:assignment4/presentation/pages/web/navigations/desktopHome.dart';
import 'widgets/sideBar.dart';

// LAYOUT SCREEN DESKTOP
class DesktopLayoutScreen extends StatefulWidget {
  const DesktopLayoutScreen({super.key});

  @override
  _DesktopLayoutScreenState createState() => _DesktopLayoutScreenState();
}

class _DesktopLayoutScreenState extends State<DesktopLayoutScreen> {
  late Widget _currentScreen;//late to _currentScreen initialize later 

  @override
  void initState() {
    super.initState();
    _currentScreen = const DesktopHomeScreen();
  }

  void _updateScreen(Widget newScreen) {
    setState(() {
      _currentScreen = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;   //size of device
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          SideBar(
            width: width * 0.15,
            updateScreen: _updateScreen,
          ),
          SizedBox(
            width: width * 0.85,
            height: height,
            child: _currentScreen,
          ),
        ],
      ),
    );
  }
}