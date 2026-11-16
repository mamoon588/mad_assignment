import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const List<String> cities = [
    'Islamabad',
    'Lahore',
    'Karachi',
    'Peshawar',
    'Quetta',
    'Multan',
    'Faisalabad',
    'Rawalpindi',
    'Sialkot',
    'Hyderabad',
    'Gujranwala',
    'Abbottabad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List')),
      drawer: const AppDrawer(current: 'list'),
      body: Column(
        children: [
          // ListView showing 12 items (requirement: at least 10)
          Expanded(
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(cities[index]),
                subtitle: const Text('Tap to see a message'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You selected ${cities[index]}')),
                ),
              ),
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
