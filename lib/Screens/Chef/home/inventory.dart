import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  // Sample inventory data
  final List<InventoryItem> inventoryItems = [
    InventoryItem(
      name: 'Tomato',
      quantity: '3 kg',
      icon: '🍅',
      status: InventoryStatus.lowStock,
    ),
    InventoryItem(
      name: 'Chicken',
      quantity: '4 kg',
      icon: '🍗',
      status: InventoryStatus.lowStock,
    ),
    InventoryItem(
      name: 'Onion',
      quantity: '1 kg',
      icon: '🧅',
      status: InventoryStatus.lowStock,
    ),
    InventoryItem(
      name: 'cabbage',
      quantity: '5 kg',
      icon: '🥬',
      status: InventoryStatus.lowStock,
    ),
    InventoryItem(
      name: 'carrot',
      quantity: '4 kg',
      icon: '🥕',
      status: InventoryStatus.lowStock,
    ),
    InventoryItem(
      name: 'Chicken',
      quantity: '0 kg',
      icon: '🍗',
      status: InventoryStatus.outOfStock,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header
          const Header(),

          // Tab Bar
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color(0xFFFFC107),
                borderRadius: BorderRadius.circular(25),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: GoogleFonts.inter(
                fontSize: isTablet ? 14 : 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: GoogleFonts.inter(
                fontSize: isTablet ? 14 : 12,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Low Stock'),
                Tab(text: 'Out of Stock'),
                Tab(text: 'Expiring Soon'),
              ],
            ),
          ),

          // Page Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.animateTo(index);
              },
              children: [
                _buildInventoryList(InventoryStatus.lowStock),
                _buildInventoryList(InventoryStatus.outOfStock),
                _buildInventoryList(InventoryStatus.expiringSoon),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildInventoryList(InventoryStatus status) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;

    // Filter items based on status
    List<InventoryItem> filteredItems = inventoryItems
        .where((item) => item.status == status)
        .toList();

    // Add dummy items for demonstration if needed
    if (status == InventoryStatus.expiringSoon && filteredItems.isEmpty) {
      filteredItems = [
        InventoryItem(
          name: 'Milk',
          quantity: '2 L',
          icon: '🥛',
          status: InventoryStatus.expiringSoon,
        ),
        InventoryItem(
          name: 'Bread',
          quantity: '5 pieces',
          icon: '🍞',
          status: InventoryStatus.expiringSoon,
        ),
      ];
    }

    if (filteredItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No items found',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return _buildInventoryCard(filteredItems[index]);
        },
      ),
    );
  }

  Widget _buildInventoryCard(InventoryItem item) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final bool isTablet = screenWidth > 600;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: isTablet ? 60 : 50,
            height: isTablet ? 60 : 50,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                item.icon,
                style: TextStyle(fontSize: isTablet ? 28 : 24),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.inter(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Quantity: ${item.quantity}',
                  style: GoogleFonts.inter(
                    fontSize: isTablet ? 14 : 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Restock button
          ElevatedButton(
            onPressed: () {
              _showRestockDialog(item);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB8860B),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 20 : 16,
                vertical: isTablet ? 12 : 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Restock Now',
              style: GoogleFonts.inter(
                fontSize: isTablet ? 12 : 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRestockDialog(InventoryItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Restock ${item.name}',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
          ),
          content: Text(
            'Do you want to restock ${item.name}?',
            style: GoogleFonts.inter(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} restocked successfully!'),
                    backgroundColor: const Color(0xFFFFC107),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                foregroundColor: Colors.black,
              ),
              child: Text(
                'Restock',
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Data Models
class InventoryItem {
  final String name;
  final String quantity;
  final String icon;
  final InventoryStatus status;

  InventoryItem({
    required this.name,
    required this.quantity,
    required this.icon,
    required this.status,
  });
}

enum InventoryStatus { lowStock, outOfStock, expiringSoon }

// Your existing Header class
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final bool isTablet = screenWidth > 600;

    final double headerHeight = 88.0;
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

// Your existing BottomNavigation class
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
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
          }, context),
          _buildNavItem('assets/images/kitchen.png', true, () {
            // Current page - Inventory/Kitchen
          }, context),
          _buildNavItem('assets/images/chef-hat.png', false, () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
          }, context),
          _buildNavItem('assets/images/user.png', false, () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
          }, context),
        ],
      ),
    );
  }
}
