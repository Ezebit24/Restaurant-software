import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restureant_app/onboarding_pages/onboard2.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });

          if (page == 1) {
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingPageTwo(),
                ),
              );
            });
          }
        },
        children: [_buildOnboardingScreen(), _buildSecondScreen()],
      ),
    );
  }

  Widget _buildOnboardingScreen() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xFF212121),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/bgImg.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF212121),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white24,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(flex: 1), // Flexible spacing at the top
                  Image.asset(
                    'assets/images/hat.png',
                    height: screenHeight * 0.15, // Responsive height
                    width: screenHeight * 0.15, // Responsive width
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: screenHeight * 0.1,
                        width: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(
                            screenHeight * 0.05,
                          ),
                        ),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: screenHeight * 0.05,
                        ),
                      );
                    },
                  ),
                  const Spacer(flex: 1), // Flexible spacing
                  Text(
                    'Hotbox Kitchen',
                    style: GoogleFonts.belgrano(
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 1), // Flexible spacing
                  Text(
                    'At Hotbox Kitchen, we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 1), // Flexible spacing
                  Text(
                    'Experience the perfect blend of taste and wellness with every meal. From farm to table, we ensure quality in every bite.',
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 2), // More flexible spacing
                  Image.asset(
                    'assets/images/init_one.png',
                    height: screenHeight * 0.35, // Responsive height
                    width: screenHeight * 0.35, // Responsive width
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: screenHeight * 0.35,
                        width: screenHeight * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                  const Spacer(flex: 2), // More flexible spacing
                  Container(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Dynamic dots based on currentPage
                        ...List.generate(2, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPage == index
                                  ? const Color(0xFFC79836)
                                  : Colors.white,
                            ),
                          );
                        }),
                        // The third dot, which is always inactive in this setup
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
                  const Spacer(flex: 1), // Flexible spacing at the bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondScreen() {
    return Container(
      color: const Color(0xFF212121),
      child: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Loading next screen...',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
