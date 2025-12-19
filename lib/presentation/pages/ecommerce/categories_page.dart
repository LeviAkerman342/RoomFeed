import 'package:flutter/material.dart';

class EcommerceCategoriesPage extends StatelessWidget {
  const EcommerceCategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'T-Shirts', 'icon': Icons.checkroom, 'color': Colors.blue},
    {'title': 'Pants', 'icon': Icons.checkroom, 'color': Colors.green},
    {'title': 'Dresses', 'icon': Icons.checkroom, 'color': Colors.pink},
    {'title': 'Jackets', 'icon': Icons.checkroom, 'color': Colors.orange},
    {'title': 'Shoes', 'icon': Icons.checkroom, 'color': Colors.purple},
    {'title': 'Accessories', 'icon': Icons.watch, 'color': Colors.red},
    {'title': 'Hats', 'icon': Icons.checkroom, 'color': Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return GestureDetector(
            onTap: () {
              // TODO: переход в категорию
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Открываем ${cat['title']}')),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: (cat['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cat['color'] as Color),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cat['icon'] as IconData,
                    size: 48,
                    color: cat['color'] as Color,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    cat['title'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: cat['color'] as Color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
