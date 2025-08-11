import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restureant_app/onboarding_pages/onboard3.dart';

class OnboardingPageTwo extends StatefulWidget {
  const OnboardingPageTwo({Key? key}) : super(key: key);

  @override
  State<OnboardingPageTwo> createState() => _OnboardingPageTwoState();
}

class _OnboardingPageTwoState extends State<OnboardingPageTwo> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final safePadding = MediaQuery.of(context).padding;
    final availableHeight = screenHeight - safePadding.top - safePadding.bottom;

    // Calculate responsive sizes based on screen height
    final isSmallScreen = availableHeight < 700;
    final iconSize = isSmallScreen ? 100.0 : 131.0;
    final titleFontSize = isSmallScreen ? 26.0 : 32.0;
    final descriptionFontSize = isSmallScreen ? 14.0 : 16.0;
    final verticalSpacing = isSmallScreen ? 20.0 : 30.0;
    final smallSpacing = isSmallScreen ? 15.0 : 20.0;
    final bottomPadding = isSmallScreen ? 30.0 : 40.0;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardingpageThree(),
              ),
            );
          }
        },
        children: [
          Container(
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
                  // Top content section - flexible height
                  Expanded(
                    flex: isSmallScreen ? 5 : 3,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Chef hat icon with responsive size
                                Container(
                                  width: iconSize,
                                  height: iconSize,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(0, 255, 255, 255),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/hat.png',
                                      width: iconSize,
                                      height: iconSize,
                                    ),
                                  ),
                                ),
                                SizedBox(height: verticalSpacing),

                                // Main title with responsive font size
                                Text(
                                  'Hotbox Kitchen',
                                  style: GoogleFonts.belgrano(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: verticalSpacing),

                                // Description text with responsive padding and font size
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        screenWidth *
                                        0.1, // 10% of screen width
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'At [Restaurant Name], we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: descriptionFontSize,
                                          color: Colors.white,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(height: smallSpacing),
                                      Text(
                                        'At [Restaurant Name], we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: descriptionFontSize,
                                          color: Colors.white,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Image section - flexible height
                  Expanded(
                    flex: isSmallScreen ? 3 : 2,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: double.infinity,
                          height: constraints.maxHeight,
                          child: Image.asset(
                            'assets/images/plate.png',
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),

                  // Updated Page indicators with your custom styling
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
                        // Second dot (active) - golden/yellow color for current page
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
                        // Third dot (inactive)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Additional pages can be added here
          Container(), // Placeholder for next page
          Container(), // Placeholder for third page
        ],
      ),
    );
  }
}
