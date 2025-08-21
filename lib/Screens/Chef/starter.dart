import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restureant_app/Screens/Chef/home.dart';
import 'package:restureant_app/Screens/Chef/order.dart';

// This is the main class for the Starter screen.
class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  // Helper method to build the special item widgets.
  Widget _buildSpecialItem(String imagePath, {double? width, double? height}) {
    return Container(
      // Use BoxConstraints to ensure the image is responsive
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
    final double horizontalPadding = screenWidth * (isTablet ? 0.06 : 0.04);
    final double verticalPadding = screenHeight * (isTablet ? 0.02 : 0.015);

    // Dynamic header height based on screen size, with clamping
    final double headerHeight = isTablet
        ? (screenHeight * 0.35).clamp(280.0, 350.0)
        : (screenHeight * 0.32).clamp(240.0, 300.0);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/bgImg.png'),
            fit: BoxFit
                .cover, // This ensures the image covers the entire container
            alignment: Alignment.center,
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
                      // App Bar - Responsive height
                      Container(
                        height: screenHeight * (isTablet ? 0.07 : 0.06),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image size is percentage-based
                                Container(
                                  width: screenWidth * (isTablet ? 0.08 : 0.06),
                                  height:
                                      screenWidth * (isTablet ? 0.08 : 0.06),
                                  constraints: BoxConstraints(
                                    minWidth: 24,
                                    minHeight: 24,
                                    maxWidth: 40,
                                    maxHeight: 40,
                                  ),
                                  child: Image.asset(
                                    'assets/images/hat.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                // Font size is percentage-based
                                Text(
                                  'Hotbox Kitchen',
                                  style: GoogleFonts.belgrano(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        screenWidth * (isTablet ? 0.04 : 0.03),
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
                                    // Font sizes are percentage-based
                                    Text(
                                      'Good Morning',
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            (isTablet ? 0.08 : 0.06),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'Anu',
                                      style: TextStyle(
                                        fontSize:
                                            screenWidth *
                                            (isTablet ? 0.08 : 0.06),
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
                                  margin: EdgeInsets.only(
                                    left: screenWidth * 0.025,
                                  ),
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

                      // Search Bar - Responsive height
                      Container(
                        height: screenHeight * (isTablet ? 0.07 : 0.06),
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
                            // Icon size is percentage-based
                            Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: screenWidth * (isTablet ? 0.07 : 0.055),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    color: const Color.fromRGBO(
                                      158,
                                      158,
                                      158,
                                      1,
                                    ),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
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
                                size: screenWidth * (isTablet ? 0.065 : 0.05),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            Container(
                              width: screenWidth * (isTablet ? 0.11 : 0.09),
                              height: screenWidth * (isTablet ? 0.11 : 0.09),
                              margin: EdgeInsets.only(
                                right: screenWidth * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE600),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.black87,
                                  size:
                                      screenWidth * (isTablet ? 0.055 : 0.045),
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
                        height: screenHeight * (isTablet ? 0.05 : 0.04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8860B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Starter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * (isTablet ? 0.05 : 0.045),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: verticalPadding * 1.5),

                      // Chef's Specials Grid
                      ChefsSpecialsGrid(),

                      // Bottom padding for floating action button
                      SizedBox(height: screenHeight * (isTablet ? 0.12 : 0.11)),
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

// Chef's Specials Grid Widget
class ChefsSpecialsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> specials = [
    {
      "title": "Grilled Lemon Butter Salmon",
      "image": "assets/Images/OrdersPage/starter1.png",
      "type": "Non-Veg",
      "isVeg": false,
      "description":
          "A Perfect blend of fresh herbs, Creamy butter, and tangy lemon, served with seasonal vegetables and garlic mashed potatoes.",
      "price": "\$ 450",
      "combo": "Combo Available - Add Soup for \$ 100",
    },
    {
      "title": "Baingan Bharta",
      "image": "assets/Images/OrdersPage/starter2.png",
      "type": "Veg",
      "isVeg": true,
      "description":
          "Smoky roasted eggplant mashed and simmered with vibrant spices, fresh tomatoes, onions, and cilantro, creating a flavorful and comforting Indian dish",
      "price": "\$ 399",
      "combo": "Combo Available - Add Soup for \$ 100",
    },
    {
      "title": "Chicken Noodle Soup",
      "image": "assets/Images/OrdersPage/starter3.png",
      "type": "Non-Veg",
      "isVeg": false,
      "description":
          "A hearty and comforting bowl of chicken noodle soup, made with tender chicken, fresh vegetables, and savory broth.",
      "price": "\$ 150",
      "combo": "No combo available",
    },
    {
      "title": "Caprese Skewers",
      "image": "assets/Images/OrdersPage/starter4.png",
      "type": "Veg",
      "isVeg": true,
      "description":
          "Fresh mozzarella, cherry tomatoes, and basil drizzled with a balsamic glaze. A light and refreshing appetizer.",
      "price": "\$ 250",
      "combo": "No combo available",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final bool isTablet = screenWidth > 600;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specials.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: screenWidth * 0.03,
        mainAxisSpacing: screenWidth * 0.03,
        childAspectRatio: isTablet ? 0.65 : 0.58,
      ),
      itemBuilder: (context, index) {
        final item = specials[index];
        return _buildSpecialCard(
          imagePath: item["image"],
          title: item["title"],
          isVeg: item["isVeg"],
          description: item["description"],
          price: item["price"],
          combo: item["combo"],
          context: context,
        );
      },
    );
  }

  Widget _buildSpecialCard({
    required String imagePath,
    required String title,
    required bool isVeg,
    required String description,
    required String price,
    required String combo,
    required BuildContext context,
  }) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final bool isTablet = screenWidth > 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Changed color to white
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * (isTablet ? 0.05 : 0.04)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Chef\'s Specials',
              style: TextStyle(
                fontSize: screenWidth * (isTablet ? 0.04 : 0.035),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.015 : 0.01)),

            // Food Image
            Container(
              height: screenHeight * (isTablet ? 0.12 : 0.1),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: screenWidth * 0.1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.015 : 0.01)),

            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * (isTablet ? 0.035 : 0.03),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.01 : 0.008)),

            // Veg/Non-Veg indicator
            Row(
              children: [
                Container(
                  width: screenWidth * (isTablet ? 0.04 : 0.035),
                  height: screenWidth * (isTablet ? 0.04 : 0.035),
                  child: Image.asset(
                    isVeg
                        ? 'assets/icons/chef/veg.png'
                        : 'assets/icons/chef/veg.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: screenWidth * 0.015),
                Text(
                  isVeg ? 'Veg' : 'Non-Veg',
                  style: TextStyle(
                    fontSize: screenWidth * (isTablet ? 0.03 : 0.025),
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.012 : 0.01)),

            // Description
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * (isTablet ? 0.028 : 0.023),
                  color: Colors.black87,
                  height: 1.3,
                ),
                maxLines: isTablet ? 4 : 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.015 : 0.01)),

            // Price
            Text(
              price,
              style: TextStyle(
                fontSize: screenWidth * (isTablet ? 0.04 : 0.035),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.008 : 0.005)),

            // Combo text
            Text(
              combo,
              style: TextStyle(
                fontSize: screenWidth * (isTablet ? 0.025 : 0.02),
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * (isTablet ? 0.015 : 0.01)),

            // Order Now button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add order functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB8860B), // Sandy brown color
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * (isTablet ? 0.012 : 0.01),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Order Now',
                  style: TextStyle(
                    fontSize: screenWidth * (isTablet ? 0.03 : 0.025),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
    final double screenWidth = size.width;
    final bool isTablet = screenWidth > 600;
    // Icon size is percentage-based
    final double iconSize = screenWidth * (isTablet ? 0.07 : 0.055);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * (isTablet ? 0.05 : 0.04),
          vertical: screenWidth * (isTablet ? 0.03 : 0.02),
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
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final bool isTablet = screenWidth > 600;
    // Navigation bar height and margin are percentage-based
    final double navHeight = screenHeight * (isTablet ? 0.08 : 0.07);
    final double margin = screenWidth * (isTablet ? 0.08 : 0.05);

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
          _buildNavItem('assets/images/kitchen.png', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Orders()),
            );
          }, context),
          _buildNavItem('assets/images/chef-hat.png', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }, context),
          _buildNavItem('assets/images/user.png', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }, context),
        ],
      ),
    );
  }
}
