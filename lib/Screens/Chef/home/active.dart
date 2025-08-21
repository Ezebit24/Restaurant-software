import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Assuming these files exist
import 'package:restureant_app/Screens/Chef/home.dart';
import 'package:restureant_app/Screens/Chef/order.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Correctly define isTablet here
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            const Header(),

            const SizedBox(height: 20),

            // Active Orders Title
            Text(
              'Active Orders',
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            // Orders List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  OrderCard(
                    orderId: '#A1023',
                    table: '6',
                    time: '11:45 AM',
                    items: const ['1 Chicken Biryani', '2 lime Juice'],
                    status: 'Preparing',
                    statusColor: const Color(0xFFE8F5E8),
                    statusTextColor: const Color(0xFF2E7D32),
                    buttonFilled: true,
                    onButtonPressed: () {
                      // Handle button press for this card
                    },
                  ),
                  const SizedBox(height: 12),
                  OrderCard(
                    orderId: '#A1024',
                    table: '7',
                    time: '11:45 AM',
                    items: const ['2 Chicken Biryani'],
                    status: 'Ready',
                    statusColor: const Color(0xFF2E7D32),
                    statusTextColor: Colors.white,
                    buttonFilled: false,
                    onButtonPressed: () {
                      // Handle button press for this card
                    },
                  ),
                  const SizedBox(height: 12),
                  OrderCard(
                    orderId: '#A1025',
                    table: '8',
                    time: '11:45 AM',
                    items: const ['2 Dosa, Sambar'],
                    status: 'preparing',
                    statusColor: const Color(0xFFE8F5E8),
                    statusTextColor: const Color(0xFF2E7D32),
                    buttonFilled: true,
                    onButtonPressed: () {
                      // Handle button press for this card
                    },
                  ),
                  const SizedBox(height: 12),
                  OrderCard(
                    orderId: '#A1026',
                    table: '7',
                    time: '11:45 AM',
                    items: const ['2 Chicken Biryani'],
                    status: 'Served',
                    statusColor: const Color(0xFF2E7D32),
                    statusTextColor: Colors.white,
                    buttonFilled: false,
                    onButtonPressed: () {
                      // Handle button press for this card
                    },
                  ),
                  const SizedBox(height: 100), // Space for bottom nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String table;
  final String time;
  final List<String> items;
  final String status;
  final Color statusColor;
  final Color statusTextColor;
  final bool buttonFilled;
  final VoidCallback onButtonPressed;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.table,
    required this.time,
    required this.items,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    required this.buttonFilled,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID and Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusTextColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Table and Time
          Row(
            children: [
              Text(
                'Table: $table',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Time: $time',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Items
          ...items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    item,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              )
              .toList(),

          const SizedBox(height: 12),

          // Button
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonFilled
                    ? const Color(0xFFB8860B)
                    : Colors.white,
                side: buttonFilled
                    ? null
                    : const BorderSide(color: Colors.grey, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                elevation: 0,
              ),
              child: Text(
                'Mark as Ready',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: buttonFilled ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        ],
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
            // Set to true to make it active
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Orders(),
              ), // Correct class name
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

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final bool isTablet = screenWidth > 600;

    final double headerHeight = 88.0; // Change this line
    final double verticalPadding = headerHeight * 0.05;
    final double horizontalPadding = isTablet
        ? screenWidth * 0.06
        : screenWidth * 0.04;

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
