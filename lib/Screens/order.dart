import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the main class for the Orders screen.
class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // Helper method to build the special item widgets.
  // It has been moved inside this class to resolve the error.
  Widget _buildSpecialItem(String imagePath, {double? width, double? height}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: BoxFit.contain,
      semanticLabel: 'Special dish image',
    );
  }

  // Helper method to build the category cards.
  // It has also been moved inside this class.
  Widget _buildCategoryCard(String title, String imageUrl) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15, // Responsive height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.028, // Responsive font size
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/bgImg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header Section - Responsive layout
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: 260,
                    maxHeight: size.height * 0.45,
                  ),
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC107),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App Bar
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/hat.png',
                                width: size.width * 0.08,
                                height: size.width * 0.08,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: size.height * 0.008),
                              Text(
                                'Hotbox Kitchen',
                                style: GoogleFonts.belgrano(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.015),

                      // Welcome Message with responsive header.png layout
                      Container(
                        height: size.height * 0.18,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Good Morning',
                                      style: TextStyle(
                                        fontSize: size.width * 0.065,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Anu',
                                      style: TextStyle(
                                        fontSize: size.width * 0.065,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: size.width * 0.02,
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: size.width * 0.45,
                                  maxHeight: size.height * 0.16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/Images/header.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),

                      // New Search Bar with Notification
                      Container(
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: size.width * 0.05,
                            ),
                            SizedBox(width: size.width * 0.03),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontSize: size.width * 0.035,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic,
                                color: Colors.grey[700],
                                size: size.width * 0.05,
                              ),
                              padding: EdgeInsets.all(size.width * 0.02),
                              constraints: BoxConstraints(
                                minWidth: size.width * 0.08,
                                minHeight: size.width * 0.08,
                              ),
                            ),
                            Container(
                              width: size.width * 0.08,
                              height: size.width * 0.08,
                              margin: EdgeInsets.only(right: size.width * 0.02),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE600),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.black87,
                                  size: size.width * 0.04,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Section
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menu Button
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF8D6E63),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),

                      // Today's Specials
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                          horizontal: size.width * 0.08,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Special items with responsive sizing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: _buildSpecialItem(
                                    'assets/Images/spec1.png',
                                    width: size.width * 0.2,
                                    height: size.width * 0.2,
                                  ),
                                ),
                                Flexible(
                                  child: _buildSpecialItem(
                                    'assets/Images/spec2.png',
                                    width: size.width * 0.25,
                                    height: size.width * 0.2,
                                  ),
                                ),
                                Flexible(
                                  child: _buildSpecialItem(
                                    'assets/Images/spec3.png',
                                    width: size.width * 0.2,
                                    height: size.width * 0.2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            Text(
                              "Today's Specials / Chef's Specials",
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),

                      // Category Grid
                      Row(
                        children: [
                          Expanded(
                            child: _buildCategoryCard(
                              'Starters',
                              'assets/Images/starters.jpg',
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          Expanded(
                            child: _buildCategoryCard(
                              'Main Course',
                              'assets/Images/main_course.jpg',
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          Expanded(
                            child: _buildCategoryCard(
                              'Breads',
                              'assets/Images/breads.jpg',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: _buildCategoryCard(
                              'Noodles &\nPasta',
                              'assets/Images/noodles.jpg',
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          Expanded(
                            child: _buildCategoryCard(
                              'Sides &\nSnacks',
                              'assets/Images/snacks.jpg',
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          Expanded(
                            child: _buildCategoryCard(
                              'Beverages',
                              'assets/Images/beverages.jpg',
                            ),
                          ),
                        ],
                      ),
                      // Add bottom padding to avoid overlap with floating action button
                      SizedBox(height: size.height * 0.12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BottomNavigation(),
    );
  }
}

// This class is a separate widget and did not have any errors.
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  Widget _buildNavItem(String imageUrl, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Image.asset(
              imageUrl,
              color: Colors.white,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, color: Colors.white, size: 22),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 59,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('assets/images/home_icon.png', 'Home', false),
          _buildNavItem('assets/images/kitchen.png', 'Orders', true),
          _buildNavItem('assets/images/chef-hat.png', 'Chef', false),
          _buildNavItem('assets/images/user.png', 'Profile', false),
        ],
      ),
    );
  }
}
