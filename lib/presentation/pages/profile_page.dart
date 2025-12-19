import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EcommerceProfilePage extends StatelessWidget {
  const EcommerceProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=12')),
          const SizedBox(height: 16),
          const Text('Anna Smith', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('anna.smith@example.com', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 32),
          _profileTile(Icons.shopping_bag_outlined, 'My Orders', () {}),
          _profileTile(Icons.location_on_outlined, 'Shipping Address', () {}),
          _profileTile(Icons.payment, 'Payment Methods', () {}),
          _profileTile(Icons.favorite_border, 'Wishlist', () {}),
          _profileTile(Icons.settings_outlined, 'Settings', () {}),
          _profileTile(Icons.help_outline, 'Help & Support', () {}),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              context.go('/projects'); 
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Exit Template', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _profileTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}