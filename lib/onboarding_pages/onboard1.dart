import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

          // Navigate to Onboard2 when swiped to page
          if (page == 1) {
            // Add a small delay to ensure smooth transition
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingPage()),
              );
            });
          }
        },
        children: [_buildOnboardingScreen(), _buildSecondScreen()],
      ),
    );
  }

  Widget _buildOnboardingScreen() {
    return Container(
      color: const Color(0xFF212121), // Set background color to #212121
      child: Stack(
        children: [
          // Background image with opacity to show the container color
          Positioned.fill(
            child: Opacity(
              opacity: 0.7, // Adjust opacity to blend with background color
              child: Image.asset(
                'assets/images/bgImg.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if image fails to load
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
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // Chef hat image
                  Image.asset(
                    'assets/images/hat.png',
                    height: 80,
                    width: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: 40,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Main title
                  Text(
                    'Hotbox Kitchen',
                    style: GoogleFonts.belgrano(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // First description paragraph
                  Text(
                    'At Hotbox Kitchen, we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // Second description paragraph
                  Text(
                    'Experience the perfect blend of taste and wellness with every meal. From farm to table, we ensure quality in every bite.',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(flex: 2),

                  // Yellow character image with error handling
                  Image.asset(
                    'assets/images/init_one.png',
                    height: 296,
                    width: 296,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 296,
                        width: 296,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),

                  const Spacer(flex: 1),

                  // Page indicator dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == currentPage ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == currentPage
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  // Swipe indicator with tap functionality
                  GestureDetector(
                    onTap: () {
                      // Allow tap to continue as well
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Swipe right to continue',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
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

// Placeholder for Onboard2 class
class Onboard2 extends StatelessWidget {
  const Onboard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        title: const Text('Onboard 2'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Welcome to Onboard2!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
