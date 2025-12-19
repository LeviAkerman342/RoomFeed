import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EcommerceHomePage extends StatelessWidget {
  const EcommerceHomePage({super.key});

  final List<Map<String, dynamic>> recommendations = const [
    {
      'title': 'Amazing T-shirt',
      'price': 12.00,
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
    },
    {
      'title': 'Fabulous Pants',
      'price': 15.00,
      'image':
          'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-commerce'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () => context.go('/ecommerce/cart'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Perfect for you',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) =>
                    _productCard(recommendations[i % 2], context),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'For this summer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: 4,
              itemBuilder: (context, i) =>
                  _productCard(recommendations[i % 2], context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/ecommerce/product/1');
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product['image'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '€${product['price']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
