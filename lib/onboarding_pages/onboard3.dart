import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restureant_app/Auth_pages/loginPage.dart';
//import 'package:restureant_app/onboarding_pages/initial_page.dart';

class OnboardingpageThree extends StatefulWidget {
  const OnboardingpageThree({Key? key}) : super(key: key);

  @override
  State<OnboardingpageThree> createState() => _OnboardingpageThreeState();
}

class _OnboardingpageThreeState extends State<OnboardingpageThree> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: _navigateToLogin,
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF212121),
            image: DecorationImage(
              image: AssetImage('assets/images/bgImg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Top content section
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Chef hat icon - responsive size
                        Container(
                          width: screenWidth * 0.28,
                          height: screenWidth * 0.28,
                          constraints: const BoxConstraints(
                            minWidth: 100,
                            maxWidth: 150,
                            minHeight: 100,
                            maxHeight: 150,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(0, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/hat.png',
                              width: screenWidth * 0.28,
                              height: screenWidth * 0.28,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.025),

                        // Main title - responsive font size
                        Text(
                          'Hotbox Kitchen',
                          style: GoogleFonts.belgrano(
                            fontSize: screenWidth * 0.075,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Description text - responsive and scrollable if needed
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'At [Restaurant Name], we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  'At [Restaurant Name], we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Chef character image section
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/women.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Bottom indicators section
                Container(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First dot (inactive)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      // Second dot (inactive)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      // Third dot (active) - golden/yellow color
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                            0xFFC79836,
                          ), // Golden color for active dot
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
