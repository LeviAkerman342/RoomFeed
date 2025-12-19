import 'package:flutter/material.dart';
import 'package:myapp/presentation/pages/ecommerce/categories_page.dart';
import 'package:myapp/presentation/pages/ecommerce/home_page.dart';
import 'package:myapp/presentation/pages/ecommerce/shop_page.dart';
import 'package:myapp/presentation/pages/profile_page.dart';

class EcommerceShell extends StatefulWidget {
  const EcommerceShell({super.key});

  @override
  State<EcommerceShell> createState() => _EcommerceShellState();
}

class _EcommerceShellState extends State<EcommerceShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const EcommerceHomePage(),
    const EcommerceCategoriesPage(),
    const EcommerceShopPage(),
    const EcommerceProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
