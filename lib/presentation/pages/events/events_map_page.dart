import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class EventsMapPage extends StatelessWidget {
  const EventsMapPage({super.key});

  final List<Map<String, dynamic>> markers = const [
    {
      'lat': 52.52,
      'lng': 13.405,
      'title': 'Great Apartment',
      'price': '€800',
      'desc': 'Perfect for a couple. Peaceful and quiet location...',
    },
    {
      'lat': 52.51,
      'lng': 13.40,
      'title': 'Concert Hall',
      'price': '€120',
      'desc': 'Maroon 5 Live',
    },
    {
      'lat': 52.53,
      'lng': 13.41,
      'title': 'Festival Grounds',
      'price': '€59',
      'desc': 'Summer Festival 2025',
    },
    {
      'lat': 52.53,
      'lng': 13.41,
      'title': 'Festival Grounds',
      'price': '€59',
      'desc': 'Summer Festival 2025',
    },
    {
      'lat': 52.53,
      'lng': 13.41,
      'title': 'Festival Grounds',
      'price': '€59',
      'desc': 'Summer Festival 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(52.52, 13.405), // Berlin
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(
          markers: markers
              .map(
                (m) => Marker(
                  point: LatLng(m['lat'] as double, m['lng'] as double),
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    onTap: () => _showMarkerDetails(context, m),
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void _showMarkerDetails(BuildContext context, Map<String, dynamic> marker) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              marker['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              marker['price'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(marker['desc']),
            const SizedBox(height: 16),
            Image.network(
              'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=500',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('See details'),
            ),
          ],
        ),
      ),
    );
  }
}
