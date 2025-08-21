import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final bool isTablet = screenWidth > 600;

    final double headerHeight = screenHeight * 0.3;
    final double verticalPadding = headerHeight * 0.05;
    final double horizontalPadding = isTablet ? screenWidth * 0.06 : screenWidth * 0.04;

    return Container(
      width: double.infinity,
      height: headerHeight,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFC107),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                  maxWidth: isTablet ? 40 : 30,
                  maxHeight: isTablet ? 40 : 30,
                ),
                child: Image.asset(
                  'assets/images/hat.png',
                  width: isTablet ? 35 : 25,
                  height: isTablet ? 35 : 25,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Hotbox Kitchen',
                style: GoogleFonts.belgrano(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 16 : 12,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
