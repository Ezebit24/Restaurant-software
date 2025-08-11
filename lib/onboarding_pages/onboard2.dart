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

          // Navigate to Onboard2 when swiped to page 1
          if (page == 1) {
            // Add a small delay to ensure smooth transition
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Onboard2()),
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
      color: const Color(0xFF2D2D2D), // Dark background color
      child: Stack(
        children: [
          // Background pattern with food icons
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFF2D2D2D)),
              child: CustomPaint(painter: FoodPatternPainter()),
            ),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(flex: 1),

                  // Chef hat image
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/hat.png',
                      height: 48,
                      width: 48,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.restaurant,
                          color: Color(0xFF2D2D2D),
                          size: 48,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Main title
                  Text(
                    'Hotbox Kitchen',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // First description paragraph
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'At Restaurant Name, we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.85),
                        height: 1.6,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Second description paragraph
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'At Restaurant Name, we believe food should be fresh, clean, and nourishing. Our dishes are crafted using local, organic ingredients to help you feel good inside and out.',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.85),
                        height: 1.6,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const Spacer(flex: 1),

                  // Character image with chef
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background circle for character
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.orange.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      // Character image
                      Image.asset(
                        'assets/images/plate.png',
                        height: 180,
                        width: 180,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Chef character placeholder
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    color: Color(
                                      0xFFFFB6C1,
                                    ), // Light pink for face
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                // Chef hat
                                Positioned(
                                  top: 20,
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                // Plate in hand
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.purple,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const Spacer(flex: 1),

                  // Page indicator dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == currentPage ? 24 : 8,
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

                  const SizedBox(height: 32),

                  // Swipe indicator with tap functionality
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Swipe right to continue',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
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
      color: const Color(0xFF2D2D2D),
      child: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.orange, strokeWidth: 3),
              SizedBox(height: 24),
              Text(
                'Loading next screen...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
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

// Custom painter for food pattern background
class FoodPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw scattered food icons as simple shapes
    final random = [
      Offset(size.width * 0.1, size.height * 0.2),
      Offset(size.width * 0.9, size.height * 0.15),
      Offset(size.width * 0.15, size.height * 0.8),
      Offset(size.width * 0.85, size.height * 0.75),
      Offset(size.width * 0.05, size.height * 0.5),
      Offset(size.width * 0.95, size.height * 0.45),
    ];

    for (int i = 0; i < random.length; i++) {
      final center = random[i];
      if (i % 2 == 0) {
        // Draw pizza slice
        canvas.drawArc(
          Rect.fromCenter(center: center, width: 40, height: 40),
          0,
          1.5,
          true,
          paint,
        );
      } else {
        // Draw hamburger
        canvas.drawRect(
          Rect.fromCenter(center: center, width: 30, height: 20),
          paint,
        );
        canvas.drawCircle(center + const Offset(0, -15), 8, paint);
        canvas.drawCircle(center + const Offset(0, 15), 8, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Placeholder for Onboard2 class
class Onboard2 extends StatelessWidget {
  const Onboard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Welcome to Hotbox Kitchen!',
              style: GoogleFonts.playfairDisplay(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'You\'re all set to explore delicious meals',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
