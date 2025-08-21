import 'package:flutter/material.dart';
import 'package:restureant_app/Screens/Chef/home.dart';
import 'package:restureant_app/Screens/Chef/order.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({Key? key}) : super(key: key);

  final Color backgroundColor = const Color(0xFFefefef);
  final Color headerBgColor = const Color(0xFFFBD9B3);
  final Color activeBadgeColor = Colors.green;
  final Color inactiveBadgeColor = Colors.red;

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
              icon: const Icon(Icons.mic, color: Colors.grey),
              onPressed: () {},
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget buildStaffCard({
    required String imageUrl,
    required String name,
    required String role,
    required String time,
    required bool isActive,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(imageUrl), // Changed to AssetImage
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF2E2E2E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF2E2E2E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF2E2E2E),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isActive ? activeBadgeColor : inactiveBadgeColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Active',
                style: const TextStyle(fontSize: 10, color: Color(0xFF2E2E2E)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                color: headerBgColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/Images/OrdersPage/staffH.png',
                      fit: BoxFit.contain, // Changed from .cover to .contain
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 16,
                    child: buildSearchBar(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Staff',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: Color(0xFF2E2E2E),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Staff on Duty',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF2E2E2E),
                        ),
                      ),
                    ),
                    buildStaffCard(
                      imageUrl:
                          'assets/images/OrdersPage/staffProf.png', // Updated image path
                      name: 'Rahul',
                      role: 'Head Chef',
                      time: '9:00 AM to 5:00 PM',
                      isActive: true,
                    ),
                    buildStaffCard(
                      imageUrl:
                          'assets/images/OrdersPage/staffProf.png', // Updated image path
                      name: 'Arun',
                      role: 'Chef',
                      time: '9:00 AM to 5:00 PM',
                      isActive: true,
                    ),
                    buildStaffCard(
                      imageUrl:
                          'assets/images/OrdersPage/staffProf.png', // Updated image path
                      name: 'Das',
                      role: 'Cleaner',
                      time: '9:00 AM to 5:00 PM',
                      isActive: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Text(
                        'Staff not on Duty',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF2E2E2E),
                        ),
                      ),
                    ),
                    buildStaffCard(
                      imageUrl:
                          'assets/images/OrdersPage/staffProf.png', // Updated image path
                      name: 'Athul',
                      role: 'Head Chef',
                      time: '9:00 AM to 5:00 PM',
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

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
