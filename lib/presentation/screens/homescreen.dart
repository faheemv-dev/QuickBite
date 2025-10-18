import 'package:flutter/material.dart';
import 'package:fudddel/presentation/screens/loginscreen.dart';
import 'package:fudddel/services/auth.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  // --- Logout handler ---
  Future<void> _handleLogout(BuildContext context) async {
    await AuthService().signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully!')),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Loginscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickBite Home'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to QuickBite!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Example card 1
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
                title: const Text('View Menu'),
                subtitle: const Text('Check out today’s specials'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to menu screen (to be implemented)
                },
              ),
            ),

            const SizedBox(height: 15),

            // Example card 2
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.shopping_cart, color: Colors.orange),
                title: const Text('My Orders'),
                subtitle: const Text('Track your orders'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to orders screen (to be implemented)
                },
              ),
            ),

            const SizedBox(height: 15),

            // Example card 3
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.orange),
                title: const Text('Settings'),
                subtitle: const Text('Manage your profile & preferences'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to settings screen (to be implemented)
                },
              ),
            ),

            const Spacer(),

            // Logout button (alternative)
            ElevatedButton.icon(
              onPressed: () => _handleLogout(context),
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
