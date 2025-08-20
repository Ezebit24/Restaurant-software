import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restureant_app/Screens/home.dart';

// This is the main class for the Orders screen.
class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // Helper method to build the special item widgets.
  // It has been moved inside this class to resolve the error.
  Widget _buildSpecialItem(String imagePath, {double? width, double? height}) {
    return Container(
      // Use BoxConstraints to ensure the image is responsive
      // It will not be smaller than 40x40 and has a flexible max width/height
      constraints: BoxConstraints(
        maxWidth: width ?? double.infinity,
        maxHeight: height ?? double.infinity,
        minWidth: 40,
        minHeight: 40,
      ),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.contain,
        semanticLabel: 'Special dish image',
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: Icon(Icons.image_not_supported, size: (width ?? 60) * 0.5),
        ),
      ),
    );
  }

  // Helper method to build the category cards.
  // It has also been moved inside this class.
  Widget _buildCategoryCard(String title, String imageUrl) {
    return LayoutBuilder(
      // LayoutBuilder allows the widget to adapt to the constraints of its parent
      builder: (context, constraints) {
        // Calculate the card height as a ratio of its parent's width,
        // then clamp it to ensure it stays within a reasonable range
        final double cardHeight = constraints.maxWidth * 1.2;
        const double minHeight = 100;
        const double maxHeight = 180;
        final double finalHeight = cardHeight.clamp(minHeight, maxHeight);

        return Container(
          height: finalHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Use Expanded with a flex value to make the image flexible
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) {},
                    ),
                  ),
                ),
              ),
              // Use Expanded for the text as well, with a different flex value
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: finalHeight * 0.05,
                    horizontal: 4,
                  ),
                  child: Center(
                    child: FittedBox(
                      // FittedBox ensures the text scales down to fit the space
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        style: TextStyle(
                          // Clamp the font size to keep it within a readable range
                          fontSize: (constraints.maxWidth * 0.12).clamp(
                            10.0,
                            16.0,
                          ),
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    // Determine if the device is a tablet based on width
    final bool isTablet = screenWidth > 600;
    final bool isLandscape = screenWidth > screenHeight;

    // Responsive padding calculated as a percentage of screen size
    final double horizontalPadding = isTablet
        ? screenWidth * 0.06
        : screenWidth * 0.04;
    final double verticalPadding = isTablet
        ? screenHeight * 0.02
        : screenHeight * 0.015;

    // Dynamic header height based on screen size, with clamping
    final double headerHeight = isTablet
        ? (screenHeight * 0.35).clamp(280.0, 350.0)
        : (screenHeight * 0.32).clamp(240.0, 300.0);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/bgImg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // Header Section - Fixed height and layout
                Container(
                  width: double.infinity,
                  height: headerHeight,
                  padding: EdgeInsets.all(horizontalPadding),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFC107),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App Bar - Fixed spacing
                      Container(
                        height: isTablet ? 60 : 50,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image size is based on tablet status
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
                                // Font size adapts to tablet status
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
                          ],
                        ),
                      ),

                      SizedBox(height: verticalPadding * 0.5),

                      // Welcome Message with header image - Fixed flex ratios
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              // Use Expanded with a flex of 2
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Font sizes adapt to tablet status
                                    Text(
                                      'Good Morning',
                                      style: TextStyle(
                                        fontSize: isTablet ? 32 : 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'Anu',
                                      style: TextStyle(
                                        fontSize: isTablet ? 32 : 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Use Expanded with a flex of 3
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Images/header.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: verticalPadding),

                      // Search Bar - Fixed height
                      Container(
                        height: isTablet ? 60 : 50,
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
                            SizedBox(width: horizontalPadding),
                            // Icon size adapts to tablet status
                            Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: isTablet ? 28 : 22,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(158, 158, 158, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 0,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic,
                                color: Colors.grey[700],
                                size: isTablet ? 26 : 20,
                              ),
                              padding: const EdgeInsets.all(8),
                            ),
                            Container(
                              width: isTablet ? 45 : 36,
                              height: isTablet ? 45 : 36,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE600),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.black87,
                                  size: isTablet ? 22 : 18,
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
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: verticalPadding),

                      // Menu Button
                      Container(
                        width: double.infinity,
                        height: isTablet ? 42 : 34,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8860B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet ? 20 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: verticalPadding * 1.5),

                      // Today's Specials
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: isTablet ? 30 : 24,
                          horizontal: isTablet ? 32 : 24,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Special items
                            LayoutBuilder(
                              builder: (context, constraints) {
                                // The item size is calculated based on the parent width,
                                // with a clamp to keep it from getting too big or small
                                final double itemSize =
                                    (constraints.maxWidth / 3.8).clamp(
                                      60.0,
                                      100.0,
                                    );
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildSpecialItem(
                                      'assets/Images/spec1.png',
                                      width: itemSize,
                                      height: itemSize,
                                    ),
                                    _buildSpecialItem(
                                      'assets/Images/spec2.png',
                                      width: itemSize * 1.1,
                                      height: itemSize,
                                    ),
                                    _buildSpecialItem(
                                      'assets/Images/spec3.png',
                                      width: itemSize,
                                      height: itemSize,
                                    ),
                                  ],
                                );
                              },
                            ),

                            SizedBox(height: isTablet ? 20 : 16),

                            Text(
                              "Today's Specials / Chef's Specials",
                              style: TextStyle(
                                fontSize: isTablet ? 22 : 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: verticalPadding * 1.5),

                      // Category Grid
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final double spacing = isTablet ? 16 : 12;
                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // The number of columns is fixed at 3
                            crossAxisCount: 3,
                            // Spacing is based on tablet status
                            crossAxisSpacing: spacing,
                            mainAxisSpacing: spacing,
                            // The child aspect ratio maintains a consistent shape
                            childAspectRatio: 0.79,
                            children: [
                              _buildCategoryCard(
                                'Starters',
                                'assets/Images/food.png',
                              ),
                              _buildCategoryCard(
                                'Main Course',
                                'assets/Images/OrdersPage/mainCourse.png',
                              ),
                              _buildCategoryCard(
                                'Breads',
                                'assets/Images/OrdersPage/breads.png',
                              ),
                              _buildCategoryCard(
                                'Noodles &\nPasta',
                                'assets/Images/OrdersPage/noodles.png',
                              ),
                              _buildCategoryCard(
                                'Sides &\nSnacks',
                                'assets/Images/OrdersPage/sides.png',
                              ),
                              _buildCategoryCard(
                                'Beverages',
                                'assets/Images/OrdersPage/bev.png',
                              ),
                              _buildCategoryCard(
                                'Meals',
                                'assets/Images/OrdersPage/meal.png',
                              ),
                              _buildCategoryCard(
                                'Desserts',
                                'assets/Images/OrdersPage/dessert.png',
                              ),
                              _buildCategoryCard(
                                'Diet',
                                'assets/Images/OrdersPage/diet.png',
                              ),
                            ],
                          );
                        },
                      ),

                      // Bottom padding for floating action button
                      SizedBox(height: isTablet ? 100 : 90),
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

// Bottom Navigation
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  Widget _buildNavItem(
    String imageUrl,
    bool isActive,
    VoidCallback? onTap,
    BuildContext context,
  ) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;
    // Icon size is based on tablet status
    final double iconSize = isTablet ? 28 : 22;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20 : 16,
          vertical: isTablet ? 12 : 8,
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: Image.asset(
            imageUrl,
            color: Colors.white,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, color: Colors.white, size: iconSize),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;
    // Navigation bar height and margin are based on tablet status
    final double navHeight = isTablet ? 70 : 59;
    final double margin = isTablet ? 30 : 20;

    return Container(
      margin: EdgeInsets.all(margin),
      height: navHeight,
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
          _buildNavItem('assets/images/home_icon.png', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }, context),
          _buildNavItem('assets/images/kitchen.png', true, null, context),
          _buildNavItem('assets/images/chef-hat.png', false, null, context),
          _buildNavItem('assets/images/user.png', false, null, context),
        ],
      ),
    );
  }
}
