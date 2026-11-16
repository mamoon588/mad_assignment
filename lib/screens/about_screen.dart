import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<Map<String, dynamic>> items = [
    {'icon': Icons.mosque, 'label': 'Faisal Mosque', 'color': Colors.teal},
    {'icon': Icons.landscape, 'label': 'Margalla Hills', 'color': Colors.green},
    {'icon': Icons.castle, 'label': 'Lahore Fort', 'color': Colors.orange},
    {'icon': Icons.beach_access, 'label': 'Clifton Beach', 'color': Colors.blue},
    {'icon': Icons.terrain, 'label': 'Hunza Valley', 'color': Colors.purple},
    {'icon': Icons.water, 'label': 'Saif-ul-Malook', 'color': Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      drawer: const AppDrawer(current: 'about'),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Places to visit',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length, // 6 items
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, i) {
                final Color c = items[i]['color'] as Color;
                return Container(
                  decoration: BoxDecoration(
                    color: c.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: c),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(items[i]['icon'] as IconData, size: 48, color: c),
                      const SizedBox(height: 8),
                      Text(
                        items[i]['label'] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
