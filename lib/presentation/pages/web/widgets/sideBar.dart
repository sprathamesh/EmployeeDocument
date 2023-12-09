import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigations/desktopHome.dart';
import '../navigations/desktopDocument.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
    required this.width,
    required this.updateScreen,
  });

  final double width;
  final Function(Widget) updateScreen;

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {
      "name": "Home",
      "icon": "assets/home.png",
      "isSelected": true,
      "route": const DesktopHomeScreen(),
    },
    {
      "name": "Documents",
      "icon": "assets/document.png",
      "isSelected": false,
      "route": const DesktopDocumentScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide.none,
          vertical: BorderSide(width: 0.5, color: Color.fromRGBO(230, 230, 230, 1)),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: tabs.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.updateScreen(tabs[index]["route"] as Widget);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Image.asset(
                    tabs[index]["icon"],
                    color: _selectedIndex == index
                        ? Color(0xFFF4811F)
                        : Colors.black,
                  ),
                  title: buildTextWidget(
                    tabs[index]["name"],
                    isSelected: _selectedIndex == index,
                  ),
                ),
              ),
            ),
          ),
          Text('Copyrights © 2023. All rights reserved.',
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  Widget buildTextWidget(String text, {bool isSelected = false}) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: isSelected ? Color(0xFFF4811F) : Colors.black,
      ),
    );
  }
}