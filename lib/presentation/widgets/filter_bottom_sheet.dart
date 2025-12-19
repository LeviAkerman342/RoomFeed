import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/bloc/explore_cubit.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final colors = [
    'BLACK',
    'WHITE',
    'GREY',
    'YELLOW',
    'BLUE',
    'PURPLE',
    'RED',
    'PINK',
    'ORANGE',
    'GOLD',
    'SILVER',
  ];
  final selectedColors = <String>{};

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const Text(
                  'Filter',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => context.read<ExploreCubit>().clearFilters(),
                  child: const Text('Clear All'),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  const ExpansionTile(
                    title: Text('Category'),
                    children: [Text('TODO')],
                  ),
                  const ExpansionTile(
                    title: Text('Price Range'),
                    children: [Text('TODO')],
                  ),
                  ExpansionTile(
                    title: const Text('Color'),
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: colors.map((color) {
                          final isSelected = selectedColors.contains(color);
                          return FilterChip(
                            label: Text(color),
                            selected: isSelected,
                            onSelected: (_) {
                              setState(() {
                                if (isSelected) {
                                  selectedColors.remove(color);
                                } else {
                                  selectedColors.add(color);
                                }
                              });
                            },
                            selectedColor: Colors.blue[100],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Size'),
                    children: [Text('TODO')],
                  ),
                  const ExpansionTile(
                    title: Text('Customer Review'),
                    children: [Text('TODO')],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<ExploreCubit>().applyFilters({
                    'colors': selectedColors.toList(),
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
