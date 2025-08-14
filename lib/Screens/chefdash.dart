import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChefDashboard extends StatelessWidget {
  const ChefDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Container(
                height: 260,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFD700),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(height: size.height * 0.03),
                      Container(
                        width: size.width * 0.22,
                        height: size.width * 0.22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/Images/chef_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Chef Anu',
                        style: GoogleFonts.belgrano(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      SizedBox(height: size.height * 0.008),
                      Text(
                        'Head Chef | South indian',
                        style: GoogleFonts.belgrano(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),

              // Contact Info
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                child: Column(
                  children: [
                    _buildInfoCard(
                      Icons.phone,
                      '+91 1234567890',
                      size,
                      textScale,
                    ),
                    SizedBox(height: size.height * 0.02),
                    _buildInfoCard(
                      Icons.email,
                      'ABC@gmail.com',
                      size,
                      textScale,
                    ),
                    SizedBox(height: size.height * 0.02),
                    _buildInfoCard(Icons.badge, 'CH 54354', size, textScale),
                    SizedBox(height: size.height * 0.02),
                    _buildInfoCard(
                      Icons.access_time,
                      '10:00 AM - 7:00 PM',
                      size,
                      textScale,
                    ),
                  ],
                ),
              ),

              // Stats
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'assets/Images/dish.png',
                        'Dishes\nPrepared today',
                        '58',
                        const Color(0xFF4CAF50),
                        size,
                        textScale,
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Expanded(
                      child: _buildStatCard(
                        'assets/Images/pending.png',
                        'Pending\nOrders',
                        '4',
                        const Color(0xFFFF9800),
                        size,
                        textScale,
                      ),
                    ),
                  ],
                ),
              ),

              // Logout
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: GoogleFonts.inter(
                        fontSize: 16 * textScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String text,
    Size size,
    double textScale,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD700),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87, size: size.width * 0.05),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14 * textScale,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String image,
    String title,
    String value,
    Color valueColor,
    Size size,
    double textScale,
  ) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.15,
            height: size.width * 0.15,
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12 * textScale,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20 * textScale,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
