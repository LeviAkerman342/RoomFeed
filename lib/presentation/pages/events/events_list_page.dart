import 'package:flutter/material.dart';

class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  final List<Map<String, dynamic>> events = const [
    {
      'title': 'Maroon 5',
      'subtitle': 'World Tour 2025',
      'date': 'Dec 20',
      'price': 'Buy tickets',
      'image':
          'https://images.unsplash.com/photo-1540039156060-76ef9d3cd59d?w=500',
    },
    {
      'title': 'Alicia Keys',
      'subtitle': 'One Night Only',
      'date': 'Dec 25',
      'price': '€89',
      'image':
          'https://images.unsplash.com/photo-1470229722913-7bf8c2a3e3d9?w=500',
    },
    {
      'title': 'Michael Jackson Tribute',
      'subtitle': 'The Ultimate Show',
      'date': 'Jan 10',
      'price': '€59',
      'image':
          'https://images.unsplash.com/photo-1511671786110-7b5912d0a3e5?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Фильтры категорий
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _filterChip('Concerts', true),
                _filterChip('Festivals', false),
                _filterChip('Theater', false),
                _filterChip('Sports', false),
                _filterChip('Exhibitions', false),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Near you
          _sectionTitle('Near you'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _eventCard(events[0], context)),
              const SizedBox(width: 16),
              Expanded(child: _eventCard(events[1], context)),
            ],
          ),
          const SizedBox(height: 32),

          // Your events
          _sectionTitle('Your events'),
          const SizedBox(height: 16),
          ...events.map((e) => _eventListItem(e, context)),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
        onSelected: (_) {},
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: () {}, child: const Text('See more')),
      ],
    );
  }

  Widget _eventCard(Map<String, dynamic> event, BuildContext context) {
    return GestureDetector(
      onTap: () => _showEventDetails(context, event),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              event['image'],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            event['title'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            event['subtitle'],
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 36),
            ),
            child: Text(event['price']),
          ),
        ],
      ),
    );
  }

  Widget _eventListItem(Map<String, dynamic> event, BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          event['image'],
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(event['title']),
      subtitle: Text(event['subtitle']),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showEventDetails(context, event),
    );
  }

  void _showEventDetails(BuildContext context, Map<String, dynamic> event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        builder: (_, controller) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                event['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                event['subtitle'],
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Image.network(
                event['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                '€89.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Text('Buy tickets'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
