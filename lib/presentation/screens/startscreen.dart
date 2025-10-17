import 'package:flutter/material.dart';
import 'package:fudddel/presentation/screens/loginscreen.dart';
import 'package:fudddel/presentation/screens/signupscreen.dart';
import 'package:fudddel/presentation/widgets/buttons.dart';
import 'package:fudddel/presentation/widgets/detector.dart';

class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  final PageController _pageController = PageController(); // Controller for PageView changing images
  int _currentPage = 0;
  final List<String> _backgroundImages = [ // List of background images for changing
    'assets/images/startt.jpg',
    'assets/images/fudd.jpg', 
    'assets/images/fd7.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Auto-slide the background images
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), () { //auto slide every 3 seconds
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1; //looping mechanism here
        if (nextPage >= _backgroundImages.length) { // If at the last page, loop back to the first
          nextPage = 0;
        }
        
        _pageController.animateToPage( //animate to next page 
          nextPage,
          duration: const Duration(milliseconds: 800), // Animation duration
          curve: Curves.easeInOut,
        );
      }
      _startAutoSlide(); // calling itself for continuous sliding
    });
  }
 @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image carousel
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: _backgroundImages.map((imagePath) {
                return Stack(
                  children: [
                    Image.asset(
                      imagePath, 
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.restaurant_menu,
                      size: 100,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "QuickBite",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Your Culinary Journey Begins",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 40),

                    // Get Started button
                    SizedBox(
                      width: 220,
                      height: 50,
                      child: Buttons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signupscreen(),
                            ),
                          );
                        },
                        text: "Get Started",
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text( 
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        CustDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Loginscreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange,
                              
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Dynamic page indicator dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_backgroundImages.length, (index) {
                        return Dot(isActive: index == _currentPage);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Page indicator dot widget
class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepOrange : Colors.white70,
        shape: BoxShape.circle,
      ),
    );
  }
}