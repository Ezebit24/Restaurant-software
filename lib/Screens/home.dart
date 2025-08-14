import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget buildCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate proportional sizes to prevent overflow
        double cardPadding = constraints.maxWidth * 0.08;
        double availableHeight = constraints.maxHeight - (cardPadding * 2);
        double imageSize = constraints.maxWidth * 0.32;
        double buttonHeight = 36; // Fixed button height as in original

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
                  onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    // Changed headerHeight to a fixed value of 260
    const double headerHeight = 260;

    return Scaffold(
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
                        childAspectRatio: isTablet
                            ? 0.85
                            : 0.85, // Increased from 0.75 to 0.85 for better text display
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final cards = [
                          {
                            'image': 'assets/images/active.png',
                            'title': 'Active Order',
                            'subtitle': 'Something short and simple here',
                            'button': 'View',
                          },
                          {
                            'image': 'assets/images/staff.png',
                            'title': 'Staff on Duty',
                            'subtitle': 'Something short and simple here',
                            'button': 'View',
                          },
                          {
                            'image': 'assets/images/status.png',
                            'title': 'Table Status',
                            'subtitle': 'Something short and simple here',
                            'button': 'View',
                          },
                          {
                            'image': 'assets/images/inventory.png',
                            'title': 'Inventory Alert',
                            'subtitle': 'Something short and simple here',
                            'button': 'View',
                          },
                        ];

                        final card = cards[index];
                        return buildCard(
                          imageUrl: card['image']!,
                          title: card['title']!,
                          subtitle: card['subtitle']!,
                          buttonText: card['button']!,
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

      // Bottom Navigation
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(size.width * 0.05),
        height: size.height * 0.085,
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
            _buildNavItem(size, 'assets/images/home_icon.png', 'Home', true),
            _buildNavItem(size, 'assets/images/kitchen.png', 'Orders', false),
            _buildNavItem(size, 'assets/images/chef-hat.png', 'Chef', false),
            _buildNavItem(size, 'assets/images/user.png', 'Profile', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    Size size,
    String imageUrl,
    String label,
    bool isActive,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size.width * 0.055,
            height: size.width * 0.055,
            child: Image.asset(
              imageUrl,
              color: Colors.white,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.error,
                color: Colors.white,
                size: size.width * 0.055,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: size.width * 0.025,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
