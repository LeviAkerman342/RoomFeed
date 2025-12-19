import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/bloc/cart_cubit.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedColor = 'Black';
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800',
                      height: 300,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Amazing T-Shirt',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '€12.00',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The perfect T-shirt for when you want to feel comfortable but still stylish...',
                  ),
                  const SizedBox(height: 24),
                  const Text('Color'),
                  Row(
                    children: ['Black', 'Grey', 'White']
                        .map(
                          (c) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () => setState(() => selectedColor = c),
                              child: CircleAvatar(
                                backgroundColor: c == 'Black'
                                    ? Colors.black
                                    : c == 'Grey'
                                    ? Colors.grey
                                    : Colors.white,
                                radius: 20,
                                child: selectedColor == c
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text('Size'),
                  Wrap(
                    children: ['XS', 'S', 'M', 'L', 'XL']
                        .map(
                          (s) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ChoiceChip(
                              label: Text(s),
                              selected: selectedSize == s,
                              onSelected: (_) =>
                                  setState(() => selectedSize = s),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().addItem(
                  CartItem(
                    id: '1',
                    title: 'Amazing T-Shirt',
                    price: 12.00,
                    imageUrl:
                        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
                    color: selectedColor,
                    size: selectedSize,
                  ),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Added to bag')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text(
                '+ Add to bag',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
