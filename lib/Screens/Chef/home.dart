import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restureant_app/Screens/Chef/home/active.dart';
import 'package:restureant_app/Screens/Chef/home/inventory.dart';
import 'package:restureant_app/Screens/Chef/home/staff.dart';
import 'package:restureant_app/Screens/Chef/home/table_stat.dart';
import 'package:restureant_app/Screens/Chef/order.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Add a state variable to track the selected index for the bottom navigation bar.
  // Index 1 corresponds to the 'Orders' icon.
  int _selectedIndex = 0;

  // This method is called when a navigation bar item is tapped.
  void _onItemTapped(int index) {
    if (index == 1) {
      // If the 'Orders' icon (index 1) is tapped, navigate to the Orders page.
      setState(() {
        _selectedIndex = index;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Orders()),
      );
    } else {
      // For other icons, just update the selected index.
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Updated buildNavItem function with responsiveness from the provided UI
  Widget _buildNavItem(
    String imageUrl,
    bool isActive,
    VoidCallback? onTap,
    BuildContext context,
  ) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;
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

  // Modified buildCard method to accept a VoidCallback
  Widget buildCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed, // New parameter for the button's action
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate proportional sizes to prevent overflow
        double cardPadding = constraints.maxWidth * 0.08;
        double imageSize = constraints.maxWidth * 0.32;
        const double buttonHeight = 36; // Fixed button height as in original

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0x26000000),
                blurRadius: 24,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            children: [
              // Card Image - Fixed proportion of available space
              Expanded(
                flex: 3,
                child: Container(
                  width: imageSize,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image_outlined,
                      color: Colors.grey[400],
                      size: imageSize * 0.5,
                    ),
                  ),
                ),
              ),

              // Spacing
              const SizedBox(height: 15),

              // Card Title - Fixed space
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // Card Subtitle - Fixed space with proper overflow handling
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 20),

              // Card Button - Fixed height
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onPressed: onPressed, // Use the new onPressed callback here
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to close the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    // Changed headerHeight to a fixed value of 260
    const double headerHeight = 260;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xFFECECEC),
        body: SafeArea(
          child: Column(
            children: [
              // Header Section
              Container(
                width: double.infinity,
                height: headerHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/homeImg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Bar with Chef Hat Image and Logo
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

                      // Flexible spacer to push greeting to middle area
                      Flexible(flex: 3, child: Container()),

                      // Good Morning Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: size.width * 0.06,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Anu',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: size.width * 0.06,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      // Flexible spacer before search bar
                      Flexible(flex: 2, child: Container()),

                      // Search Bar
                      Container(
                        height: size.height * 0.065,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(27.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.05),
                            Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: size.width * 0.055,
                            ),
                            SizedBox(width: size.width * 0.04),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: size.width * 0.04,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.02,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic,
                                color: Colors.grey[700],
                                size: size.width * 0.055,
                              ),
                            ),
                            Container(
                              width: size.width * 0.1,
                              height: size.width * 0.1,
                              margin: EdgeInsets.only(right: size.width * 0.02),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE600),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.black87,
                                  size: size.width * 0.05,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
              ),

              // Grid Section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = isTablet ? 3 : 2;
                      double spacing = constraints.maxWidth * 0.04;
                      // Increased childAspectRatio to give more height to cards
                      double childAspectRatio = isTablet ? 0.9 : 0.85;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,
                          childAspectRatio: isTablet ? 0.85 : 0.85,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final cards = [
                            {
                              'image': 'assets/images/active.png',
                              'title': 'Active Order',
                              'subtitle': 'Something short and simple here',
                              'button': 'View',
                              'page': const ActiveOrdersPage(),
                            },
                            {
                              'image': 'assets/images/staff.png',
                              'title': 'Staff on Duty',
                              'subtitle': 'Something short and simple here',
                              'button': 'View',
                              'page': const StaffPage(),
                            },
                            {
                              'image': 'assets/images/status.png',
                              'title': 'Table Status',
                              'subtitle': 'Something short and simple here',
                              'button': 'View',
                              'page': const TableStatus(),
                            },
                            {
                              'image': 'assets/images/inventory.png',
                              'title': 'Inventory Alert',
                              'subtitle': 'Something short and simple here',
                              'button': 'View',
                              'page': const Inventory(),
                            },
                          ];

                          final card = cards[index];
                          return buildCard(
                            imageUrl: card['image'] as String,
                            title: card['title'] as String,
                            subtitle: card['subtitle'] as String,
                            buttonText: card['button'] as String,
                            onPressed: () {
                              // Added navigation logic here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => card['page'] as Widget,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        // Bottom Navigation with improved responsiveness
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(isTablet ? 30 : 20),
          height: isTablet ? 70 : 59,
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
        ),
      ),
    );
  }
}
